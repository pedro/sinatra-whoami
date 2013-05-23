require "sinatra/base"

module Sinatra
  module Whoami
    # redefine compile! to store the original path with the route signature
    def compile!(verb, path, block, options = {})
      options.each_pair { |option, args| send(option, *args) }
      method_name             = "#{verb} #{path}"
      unbound_method          = generate_method(method_name, &block)
      pattern, keys           = compile path
      conditions, @conditions = @conditions, []

      [ pattern, keys, conditions, path, block.arity != 0 ?
          proc { |a,p| unbound_method.bind(a).call(*p) } :
          proc { |a,p| unbound_method.bind(a).call } ]
    end

    def self.registered(app)
      app.send(:include, Router)
    end

    module Router
      # redefine route! to save the route path in env
      def route!(base = settings, pass_block=nil)
        if routes = base.routes[@request.request_method]
          routes.each do |pattern, keys, conditions, path, block|
            pass_block = process_route(pattern, keys, conditions) do |*args|
              @env["sinatra.route"] = path
              route_eval { block[*args] }
            end
          end
        end

        # Run routes defined in superclass.
        if base.superclass.respond_to?(:routes)
          return route!(base.superclass, pass_block)
        end

        route_eval(&pass_block) if pass_block
        route_missing
      end
    end
  end
end

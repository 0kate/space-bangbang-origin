require 'dxruby'
require_relative './base'

module SpaceBangBang
  module Scene
    class Guide < BaseScene
      def completed?
        Input.key_push?(K_SPACE)
      end
    end
  end
end

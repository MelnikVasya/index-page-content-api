module Api
  module V1
    class IndicesController < ApplicationController
      def index
        render json: Index.all
      end
    end
  end
end

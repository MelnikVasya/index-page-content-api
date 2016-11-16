class Api::V1::IndicesController < ApplicationController
  def index
    render json: Index.all
  end

  def create
    op = run Index::Operation::Create, params.permit(:url)

    if op.valid?
      render json: op.model, status: :created
    else
      render json: op.errors, status: :unprocessable_entity
    end
  end
end

class ApplicationController < ActionController::API
  def run(operation_class, params, &block)
    op = operation_class.new.call(params)
    yield op if op.valid? && block_given?
    op
  end
end

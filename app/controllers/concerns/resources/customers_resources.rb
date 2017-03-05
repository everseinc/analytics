module Concerns::Resources::CustomersResources
  
  extend ActiveSupport::Concern
  extend Forwardable

  def_delegators :@base, :new, :show, :edit

  def initialize(*args, &block)
    super
    @base = Concerns::Resources::BaseResources.new
  end
end
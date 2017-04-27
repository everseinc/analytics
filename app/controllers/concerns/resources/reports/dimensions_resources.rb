module Concerns::Resources::Reports::DimensionsResources
  
  extend ActiveSupport::Concern
  extend Forwardable

  def_delegators :@base, :index, :show, :destroy

  def initialize(*args, &block)
    super
    @base = Concerns::Resources::BaseResources.new
  end
end
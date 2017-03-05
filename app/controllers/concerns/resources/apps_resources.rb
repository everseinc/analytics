module Concerns::Resources::AppsResources
  
  extend ActiveSupport::Concern
  extend Forwardable

  def_delegators :@base, :index, :new, :show, :edit

  def initialize(*args, &block)
    super
    @base = Concerns::Resources::BaseResources.new
  end
end
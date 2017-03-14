module Concerns::Resources::CustomPointsResources

  extend ActiveSupport::Concern
  extend Forwardable

  def_delegators :@base, :index

  def initialize(*args, &block)
    super
    @base = Concerns::Resources::BaseResources.new
  end
end
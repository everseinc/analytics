class DimensionDetails < ApplicationDetails

  MUST = [:key, :dimension, :project_id, :emo_block_id]

  ###
  ## class methods
  #

  class << self


    # save dim_store and dimension and emo_blocks_dimension
    def save(params)
      if !check_params(params)
        MissionFlow.instance.status = 0
        MissionFlow.instance << { error: "params must include #{[:key, :dimension, :project_id, :emo_block_id].to_s}" }
        return false
      end

      dim_store = DimStore.find_by(project_id: params[:project_id], key: params[:key])
      dim_store = DimStore.create(project_id: params[:project_id], key: params[:key]) if not dim_store

      dimension = Dimension.find_by(project_id: params[:project_id], dim_store_id: dim_store[:id], name: params[:dimension])
      dimension = Dimension.create(project_id: params[:project_id], dim_store_id: dim_store[:id], name: params[:dimension]) if not dimension

      emo_blocks_dimension = EmoBlocksDimension.create(emo_block_id: params[:emo_block_id], dimension_id: dimension[:id])

      {dim_store: dim_store, dimension: dimension, emo_blocks_dimension: emo_blocks_dimension}
    end


    # check params
    def check_params(params)
      MUST.all? do |symbol|
        params[symbol].present?
      end
    end
  end
end
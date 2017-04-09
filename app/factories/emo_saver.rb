class EmoSaver < ApplicationDetails
  attr_accessor :started_at, :ended_at, :dimension, :key, :upid, :values

  MUST = [:started_at, :ended_at, :upid, :values]


  ###
  ## instance method
  #
  
  def initialize(params)
  	self.class.checkParams(params)
  	
  	params.each do |param, value|
  		instance_variable_set("@#{params}", value)
  	end
  end



  ###
  ## class methods
  #
  
  class << self


  	# save data
  	def save(params)
  		if !check_params(params)
  			MissionFlow.instance.status = 0
        MissionFlow.instance << { error: "params must include #{MUST.to_s}" }
        return false
  		end

  		params[:project_id] = Project.get_id_from_ipid(params[:upid])
  		params[:emo_block_id] = save_emo_block(params).id
  		save_emo_records(params)

  		DimensionDetails.save(
  			key: params[:dim_store],
  			dimension: params[:dimension],
  			project_id: params[:project_id],
  			emo_block_id: params[:emo_block_id]
  		)

  		params
  	end


  	# check params
  	def check_params(params)
  		MUST.all? do |symbol|
  			params[symbol].present?
  		end
  	end


  	# save emo_block
  	def save_emo_block(params)
  		if params.key?(:key) && !params[:key].empty?
  			EmoBlock.create(project_id: params[:project_id], started_at: params[:started_at], ended_at: params[:ended_at], key: params[:key])
  		else
  			EmoBlock.create(project_id: params[:project_id], started_at: params[:started_at], ended_at: params[:ended_at])
  		end
  	end


  	# save records
  	def save_emo_records(params)
  		params[:values][:emotions].map do |emotion, records|
  			emotion_id = Emotion.find_by(name: emotion).id
  			records.map do |record|
  				EmoRecord.create(emo_block_id: params[:emo_block_id], emotion_id: emotion_id, value: record)
  			end
  		end
  	end
  end
end
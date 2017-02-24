class Project < ApplicationRecord

	###
  ## associaton
  #

  has_many :apps_projects, dependent: :destroy
  has_many :apps, through: :apps_projects
end

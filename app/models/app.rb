class App < ApplicationRecord

	###
  ## associaton
  #

  has_many :apps_customers, dependent: :destroy
  has_many :customers, through: :apps_customers

  has_many :apps_projects, dependent: :destroy
  has_many :projects, through: :apps_projects

end

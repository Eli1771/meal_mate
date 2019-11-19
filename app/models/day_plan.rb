class DayPlan < ApplicationRecord
  #custom setter/getter methods
  belongs_to :day
  belongs_to :week_plan
  has_many :recipe_plans
  has_many :recipes, through: :recipe_plans

  before_save :date_slug

  def self.clearAll
    self.all.each do |dp|
      dp.delete
    end
  end

  private

  def date_slug
    self.slug = self.date.gsub(' ', '_').downcase
  end

  def to_param
    slug
  end

end

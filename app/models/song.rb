class Song < ActiveRecord::Base
  validates :title, presence: true
  #validates :artist_name, presence: true
  validate :assess_release_year
  validates :release_year, uniqueness: true

  def assess_release_year
    if self.released == true
      if self.release_year == nil || self.release_year > Date.today.year
        self.errors[:release_year] << "If released must have a year no greater than the current and cant be a duplicate"
      end
    end
  end

end

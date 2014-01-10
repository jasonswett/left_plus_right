class User < ActiveRecord::Base
  belongs_to :role
  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :occupation, presence: true
  validates :role,       presence: true
  validates :first_name, uniqueness: { scope: [:last_name, :occupation] }
end

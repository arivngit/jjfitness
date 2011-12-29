class Member < ActiveRecord::Base
 	scope :search, lambda{|query| where("memership_number = #{query}")}
 	scope :fees_paid, where("last_paid between '#{Date.today.at_beginning_of_month
}' and '#{Date.today}'")
	scope :this_month_admissions, where("created_at > '#{Date.today.at_beginning_of_month
}'")
 	has_many :fees
end

class GenericMaster < ActiveRecord::Base
	enum status: [:active, :inactive]
	validates :name, presence: true

	def self.all_table_names
		['gender', 'language', 'religion']
	end

	def self.all_table_types
		['two_column', 'three_column']
	end

	def is_two_column?
		@generic_master_table_type == self.all_table_types[0]
	end

	def is_three_column?
		@generic_master_table_type == self.all_table_types[1]
	end

	def get_table_name
		return self.table_name
	end

	def get_table_type
		return self.table_type
	end



	# def is_type1?
	# 	GenericMaster.all_types.include? self.type 
	# end

	# def after_initialize
	# 	return unless new_record?
	# 	self.precedence = 0
	# end
end

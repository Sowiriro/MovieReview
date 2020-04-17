class Like < ApplicationRecord

    belongs_to :review 
    belongs_to :user

    validate do 
        unless user && user.votable_for?(review)
            errors.add(:base, :invalid)
        end
    end 

end

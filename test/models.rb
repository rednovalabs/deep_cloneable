module Animal
  class Human < ActiveRecord::Base
    has_many :pigs
    
    has_many :ownerships    
    has_many :chickens, :through => :ownerships
  end
  class Pig < ActiveRecord::Base
    belongs_to :human
  end
      
  class Chicken < ActiveRecord::Base
    has_many :ownerships
    has_many :humans, :through => :ownerships
  end  
  
  class Ownership < ActiveRecord::Base
    belongs_to :human
    belongs_to :chicken
    
    validates_uniqueness_of :chicken_id, :scope => :human_id
  end  
end

class GoldPiece < ActiveRecord::Base;   belongs_to :treasure  end
class Matey < ActiveRecord::Base;       belongs_to :pirate    end
class Parrot < ActiveRecord::Base;      belongs_to :pirate    end
class BattleShip < ActiveRecord::Base;  has_many   :pirates, :as => :ship end

class Pirate < ActiveRecord::Base
  belongs_to :ship, :polymorphic => true

  has_many :mateys
  has_many :treasures, :foreign_key => 'owner'
  has_many :gold_pieces, :through => :treasures
  has_one :parrot
end

class Treasure < ActiveRecord::Base
  belongs_to :pirate, :foreign_key => :owner
  belongs_to :matey
  has_many :gold_pieces
end
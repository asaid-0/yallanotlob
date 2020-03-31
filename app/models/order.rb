class Order < ApplicationRecord
    enum status: [ :waiting, :finished, :cancelled ]
    
end

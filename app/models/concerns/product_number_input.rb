module ProductNumberInput
    extend ActiveSupport::Concern

    # ALL FIELDS SHOULD BE INTEGERS IF THEY HAVE TO DO WITH MONEY
 
    def buying_cost_pck=(value)
        # Replace the dot with an empty string and then convert the value to an integer
        super(value.to_s.gsub('.', '').to_i)
    end
    
    def production_cost=(value)
        super(value.to_s.gsub('.', '').to_i)
    end
    
    # ALL FIELDS SHOULD BE INTEGERS IF THEY HAVE TO DO WITH MONEY
    def selling_cost_unit=(value)
        super(value.to_s.gsub('.', '').to_i)
    end

    def buying_cost_unit=(value)
        super(value.to_s.gsub('.', '').to_i)
    end

    def current_stock_value=(value)
        super(value.to_s.gsub('.', '').to_i)
    end

    def qty_in_stock=(value)
        super(value.to_s.gsub('.', '').to_i)
    end

    def qty_to_stock=(value)
        super(value.to_s.gsub('.', '').to_i)
    end

    def selling_cost_pck=(value)
        super(value.to_s.gsub('.', '').to_i)
    end
end
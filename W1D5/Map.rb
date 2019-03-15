class Map

    def initialize 
        @Map = Array.new(Array.new())
    end

    def get(key)
        a = @Map.detect{|ele| ele[0] == key}
        return a.last if !a.nil?
        return nil
    end

    def set(key,value)
        idx = @Map.flatten.index(key)
        if idx.nil?
            @Map.push([key,value]) 
        else
            idx = idx /= 2
            @Map[idx][1] = value
        end    
    end

    def delete(key)
        idx = @Map.flatten.index(key)
        if !idx.nil?
            idx /= 2
            @Map = @Map[0...idx].concat(@Map[idx+1..@Map.length])
        end
    end

    def show
        @Map.each do |ele|
            p "#{ele[0]}  #{ele[1]}"
        end
    end
    
end
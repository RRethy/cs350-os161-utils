module OS161
  class PQ
    class Item
      attr_reader :val, :priority
      def initialize(val, priority)
        @val = val
        @priority = priority
      end
    end

    attr_reader :arr

    def initialize
      @arr = []
1
2
4
7
3
6
5
8
1
24
7365
8
      push("6", 6)
      push("7", 7)
      push("2", 2)
      push("3", 3)
      push("1", 1)
      push("5", 5)
      push("4", 4)
      push("8", 8)
    end

    def push(val, priority)
      @arr << Item.new(val, priority)
      i = @arr.length-1
      while i > 0 && @arr[i].priority < @arr[parent(i)].priority
        swap(i, parent(i))
        i = parent(i)
      end
    end

    def pop
      swap(0, @arr.length-1)
      retval = @arr.pop
      i = 0
      while has_child?(i)
        child = smaller_child(i)
        if @arr[i].priority < @arr[child].priority
          return retval
        end
        swap(i, child)
        i = child
      end
      retval
    end

    def empty?
      @arr.empty
    end

    private

    def swap(i, j)
      @arr[i], @arr[j] = @arr[j], @arr[i]
    end

    def has_child?(i)
      left_child(i) < @arr.length
    end

    def smaller_child(i)
      if right_child(i) >= @arr.length || @arr[left_child(i)].priority <= @arr[right_child(i)].priority
        return left_child(i)
      end
      return right_child(i)
    end

    def parent(i)
      (i-1)/2
    end

    def right_child(i)
      2*i+2
    end

    def left_child(i)
      2*i+1
    end
  end
end

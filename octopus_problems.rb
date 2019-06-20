octo = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(arr)

   longest = ""
    arr.each_with_index do |fish1, idx1|
        (idx1+1...arr.length).each do |idx2|
            if arr[idx2].length > fish1.length
                longest = arr[idx2]
            end
        end
    end

    longest
end


class Array
    def merge_sort(&prc)
        prc ||= Proc.new {|a,b| a.length <=> b.length }
        return self if self.length <= 1

        mid = self.length / 2

        left = self.take(mid).merge_sort
        right = self.drop(mid).merge_sort

        merge(left, right, &prc)
    end

    def merge(left, right, &prc)
        merged = []

        until left.empty? || right.empty?
            if prc.call(left.first, right.first) == -1
                merged << left.shift
            else
                merged << right.shift
            end
        end

        merged + left + right
    end
end

def dominant_octopus(arr)
    sorted = arr.merge_sort
    sorted.last
end


def clever_octopus(arr)
    longest = ""
    arr.each do |ele|
        if ele.length > longest.length
            longest = ele
        end
    end
    longest
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, tiles)
    tiles.each_with_index do |tile, idx|
        if tile == dir
            return idx
        end
    end
end

hash = { "up"=> 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7] }

def constant_dance(dir, tiles_hash)
    tiles_hash[dir]
end
    

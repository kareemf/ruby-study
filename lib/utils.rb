module Utils
  def self.swap(arr, a, b)
    t = arr[a]
    arr[a] = arr[b]
    arr[b] = t
  end
end
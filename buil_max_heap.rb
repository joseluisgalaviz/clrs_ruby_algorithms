

def left(i)
  return 2*i+1;
end

def right(i)
  return 2*i+2;
end
def parent(i)
  return ((i)/2).floor;
end

def max_heapify(a,i,heap_size)
  l=left(i);
  r=right(i);
  if(l<heap_size && a[l]>a[i])
    largest = l;
  else
    largest=i;
  end
  if(r<heap_size && a[r]>a[largest])
    largest=r;
  end
  if(largest!=i)
    a[i] = a[i] + a[largest];
    a[largest] = a[i]-a[largest];
    a[i] = a[i]-a[largest];
    max_heapify(a,largest,heap_size);
  end
end

def build_max_heap(a)
  i = (a.size()/2).floor;
  while(i>1)
    max_heapify(a,i,a.size());
    i-=1;
  end
end

heap = [1,3,6,2,11,6,9,7,5,3,7,9,4,8,12];
build_max_heap(heap)
print heap;

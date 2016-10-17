
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

    heap = [27,17,3,16,13,10,1,5,7,12,4,8,9,0];
    print max_heapify(heap,2,heap.size());
    print heap;


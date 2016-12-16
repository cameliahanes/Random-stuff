#include <iostream>

using namespace std;

void read ( int arr[ ], int& length ){
cin >> length;
for ( int i = 0; i < length; i++ )
            cin >> arr[i];
}

void reverse_ ( int arr[ ], int length, int left, int right ){
if ( arr == NULL || length == 0 )
    return;

while ( left < right ){
    swap ( arr[left], arr[right] );
    left ++;
    right --;
}
}

void rotate_ ( int arr[ ], int length, int order ){
if ( arr == NULL || length == 0 || order < 0 ){
    cout << " Illegal argument! ";
}
    if ( order > length )
    order = order % length;
    //length of first part
    int a = length - order ;
    reverse_(arr, length, 0, a);
    reverse_(arr, length, a+1, length-1);
    reverse_(arr, length, 0, length-1);
}

void write ( int arr[ ], int length ){
for ( int i = 0; i < length; i++ )
    cout << arr[i] << " ";
}

int main()
{
    int arr[100], length;
    read(arr, length);
    cout << "Type the order: ";
    int order;
    cin >> order;
    rotate_(arr, length, order);
    write(arr, length);
    return 0;
}

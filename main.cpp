#include <iostream>
using namespace std;

int main()
{
    int a, b, c;
    cin >> a >> b >> c;
    int compotes = 0;
    if ( a == 0 || b == 0 || c == 0 ){cout << 0;}
    else{
    while ( a > 0 ){
        if ( b / a >= 2 && c / a >= 4 ){
            compotes = a + 2*a + 4*a;
            break;
        } else { a -- ;}
    }}
    cout << compotes;
    return 0;
}

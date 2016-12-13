#include <iostream>

using namespace std;

struct node{
    int data;
    struct node* next;
};

//Function to remove duplicated from s unsorted linked list;
//tis is a brute force algo because we se two loops
//just for exercise

void removeDuplicates(struct node* start){

    struct node *ptr1, *ptr2, *dup;
    ptr1 = start;

    //pick elements one by one

    while (ptr1 != NULL && ptr1->next != NULL ){
        ptr2 = ptr1;

        //compare the picked element with rest of the elements
        while(ptr2->next != NULL){
            //if duplicated, then deleet it
            if (ptr1->data == ptr2->next->data){
                //sequece of steps is important here
                dup = ptr2->next;
                ptr2->next = ptr2->next->next;
                delete(dup);
            } else{
            //this is trickier
                ptr2 = ptr2->next;
            }
        }
        ptr1 = ptr1->next;
    }
}

//function to push aa node
void push(struct node** head_ref, int new_data);
//function to print nodes in a given linked list
void printList(struct node *node);

int main()
{
    struct node* start = NULL;
    push(&start, 10);
    push(&start, 11);
    push(&start, 12);
    push(&start, 11);
    push(&start, 11);
    push(&start, 12);
    push(&start, 10);


    cout<<"This is the list before removing duplicates: \n";
    printList(start);
    removeDuplicates(start);
    cout <<"\nAnd here is the linked list after removal:\n";
    printList(start);

    return 0;
}

void push(struct node**head_ref, int new_data){
    //allocate node
    struct node* new_node = new node();
    //put in the data
    new_node->data = new_data;
    new_node->next = (*head_ref);
    *head_ref = new_node;
}

void printList(struct node* node){
    while(node!=NULL){

        cout << node->data <<" ";
        node = node->next;
    }

}





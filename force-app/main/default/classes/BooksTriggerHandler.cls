public class BooksTriggerHandler {
    Public Static Void DiscountOf10(List<Book__c> booksList){
        for(Book__c book: booksList){
            book.Price__c = book.Price__c-(book.Price__c/10);
        }
    }
}
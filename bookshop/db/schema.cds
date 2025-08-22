using { Currency, managed, sap } from '@sap/cds/common';
namespace sap.capire.bookshop;

entity Books : managed {
  key ID : Integer;
  @mandatory title  : localized String(111);
  descr  : localized String(1111);
  @mandatory author : Association to Authors;
  authors : Association to many Authors through BookAuthors;
  genre  : Association to Genres;
  stock  : Integer;
  price  : Decimal;
  currency : Currency;
  image : LargeBinary @Core.MediaType : 'image/png';
}

entity Authors : managed {
  key ID : Integer;
  @mandatory name   : String(111);
  dateOfBirth  : Date;
  dateOfDeath  : Date;
  placeOfBirth : String;
  placeOfDeath : String;
  books  : Association to many Books on books.author = $self;
}

entity BookAuthors : managed {
  book   : Association to Books;
  author : Association to Authors;
}

/** Hierarchically organized Code List for Genres */
entity Genres : sap.common.CodeList {
  key ID   : Integer;
  parent   : Association to Genres;
  children : Composition of many Genres on children.parent = $self;
}

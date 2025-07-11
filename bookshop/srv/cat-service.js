const cds = require('@sap/cds')
class CatalogService extends cds.ApplicationService { init() {
  const { Books } = cds.entities('CatalogService')

  // Register your event handlers in here, for example:
  this.after ('each', Books, book => { 
    if (book.stock > 111) { 
      book.title += ` -- 11% discount!`
    } 
  }) 

  return super.init()
}}
module.exports = CatalogService
package spec



case class Address(
                    streetAddress:Option[String],
                    otherDesignation:Option[String],
                    city:Option[String],
                    addressType:Option[AddressType])
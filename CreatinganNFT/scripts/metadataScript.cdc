import NonFungibleToken from 0x05
import CryptoPoops from 0x05

// Main script function to retrieve NFT metadata
// based on the Id from an account's public collection
pub fun main(acctAddress: Address, id: UInt64): &NonFungibleToken.NFT {
 // Borrow a reference to the public collection using the provided address
 let contract = getAccount(acctAddress).getCapability(/public/CryptoPoopsCollection)
   .borrow<&CryptoPoops.Collection>() ?? panic("Could not borrow collection reference")

 // Borrow a reference to the NFT metadata using the borrowAuthNFT function
 let nftMeta = contract.borrowAuthNFT(id: id)
 
 // Log NFT metadata
 log(nftMeta.name)
 log(nftMeta.favouriteFood)
 log(nftMeta.luckyNumber)
 
 // Cast nftMeta to &NonFungibleToken.NFT and return
 return nftMeta as &NonFungibleToken.NFT
}

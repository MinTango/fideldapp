const { expect } = require("chai");

describe("NftRunners", function () {
  it("Should return the right name and symbol", async function () {
    const MyCryptoLions = await hre.ethers.getContractFactory("NftRunners");
    const myCryptoLions = await MyCryptoLions.deploy(1234, "0x9DEC8e159CE964bA3ae5821998bB65bbE6d06d39");

    await myCryptoLions.deployed();
    //expect(await myCryptoLions.safeMint("0x9DEC8e159CE964bA3ae5821998bB65bbE6d06d39", 2, "Messi")).to.equal("keyword does not exist.");`
    await myCryptoLions.set("0x9DEC8e159CE964bA3ae5821998bB65bbE6d06d39");
    console.log(await myCryptoLions.get("0x9DEC8e159CE964bA3ae5821998bB65bbE6d06d39"));
    expect(await myCryptoLions.get("0x9DEC8e159CE964bA3ae5821998bB65bbE6d06d39")).to.equal(false);
    await myCryptoLions.safeMint("0x9DEC8e159CE964bA3ae5821998bB65bbE6d06d39", 2);
    //expect(await myCryptoLions.set("0x9DEC8e159CE964bA3ae5821998bB65bbE6d06d39")).to.equal(true);
    expect(await myCryptoLions.get("0x9DEC8e159CE964bA3ae5821998bB65bbE6d06d39")).to.equal(true);

   // const id = await myCryptoLions.safeMint("Blockcall");
    //console.log(await myCryptoLions.safeMint("0x9DEC8e159CE964bA3ae5821998bB65bbE6d06d39", 2, "Nono"));
  });
});

# chmod -R 0755 ./crypto-config
# # Delete existing artifacts
# rm -rf ./crypto-config
# rm genesis.block mychannel.tx
# rm -rf ../../channel-artifacts/*

#Generate Crypto artifactes for organizations
# cryptogen generate --config=./crypto-config.yaml --output=./crypto-config/



System channel
SYS_CHANNEL="sys-channel1"

# channel name defaults to "mychannel"
CHANNEL_NAME="mychannel1"

# echo $CHANNEL_NAME
# # This generate the Genesis Block and the configuration Block.
# # Generate System Genesis block
 configtxgen -profile OrdererGenesis -configPath . -channelID $SYS_CHANNEL  -outputBlock ./genesis1.block


# Generate channel configuration block
configtxgen -profile BasicChannel -configPath . -outputCreateChannelTx ./mychannel1.tx -channelID $CHANNEL_NAME


# The following code is to create anchor peers in the org1 and the org2

echo "#######    Generating anchor peer update for Org1MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP

echo "#######    Generating anchor peer update for Org2MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP
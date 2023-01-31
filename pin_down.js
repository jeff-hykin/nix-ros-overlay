#!/usr/bin/env -S deno run --allow-all

// 
// this is a work in progress
// 
// its designed to grab dependencies that are pulling from a tag, and change them to be pulling from a commit

import { FileSystem, glob } from "https://deno.land/x/quickr@0.6.15/main/file_system.js"
import { run, throwIfFails, zipInto, mergeInto, returnAsString, Timeout, Env, Cwd, Stdin, Stdout, Stderr, Out, Overwrite, AppendTo } from "https://deno.land/x/quickr@0.6.15/main/run.js"

const tempPath = `${FileSystem.pwd}/.ignore.temp`
const filePaths = Deno.args

async function pinDown(filePath) {
    const text = await FileSystem.read(filePath)

    // src = fetchurl {
    //     url = "https://github.com/ipa320/cob_environments-release/archive/release/noetic/cob_environments/0.6.13-1.tar.gz";
    //     name = "0.6.13-1.tar.gz";
    //     sha256 = "f6056d5196ddb7a95f096a3fa54a62bf18614e51b30a3e185df9bfb60fa36498";
    // };
    const pattern = /fetchurl *{ *\n *url *= "(.+)"; *\n( *)name *= * ".+\.tar\.gz"; *\n *sha256 *= *"(.+)";/g
    const replacements = []
    for (let match of text.matchAll(pattern)) {
        console.debug(`    found match`)
        let url = match[1]
        let indent = match[2]
        const [ folders, itemName, itemExtensionWithDot ] = FileSystem.pathPieces(url)
        // url = "https://github.com/ROBOTIS-GIT-release/turtlebot3_simulations-release/archive/release/noetic/turtlebot3_gazebo/1.3.2-2.tar.gz"
        // folders = [ ".", "https:", "github.com", "ROBOTIS-GIT-release", "turtlebot3_simulations-release", "archive", "release", "noetic", "turtlebot3_gazebo" ],
        let commitHash
        let githubUrl
        if (folders[2].match("github")) {
            githubUrl = `${folders[1]}//${folders[2]}/${folders[3]}/${folders[4]}`
            const owner = folders[3]
            const repo = folders[4]
            const tag = `${folders.slice(6).join("/")}/${itemName.replace(/\.tar$/,"")}`
            
            const repoPath = `${tempPath}/${FileSystem.basename(githubUrl)}`
            
            // ➜ git ls-remote https://github.com/ROBOTIS-GIT-release/turtlebot3_simulations-release/
            // 8cae23de85aa4ab829b18b5a9323b0d197b39a56        HEAD
            // aba9ee0404aa7263aa84af402965d678974f5a1e        refs/heads/debian/kinetic/jessie/turtlebot3_fake
            // 418771c5068cacf8fafd614a7f02e07ad5c74301        refs/heads/debian/kinetic/jessie/turtlebot3_gazebo
            // 5e0271f1af1d744648b92846c6ee43a7fbb4f491        refs/heads/debian/kinetic/jessie/turtlebot3_gazebo_plugin
            // 72011798b3df092c05c7d3894ff90826f679e317        refs/heads/debian/kinetic/jessie/turtlebot3_gazebo_ros
            // d6b822a9065a4cd75291389157ff78e7741a472e        refs/heads/debian/kinetic/jessie/turtlebot3_simulations
            // ae1554d395b9ffaee5727d0b77019bbecfea3fc6        refs/heads/debian/kinetic/turtlebot3_fake
            // 2f01241f44f8070e12984c6bd67f29d43d1791e0        refs/heads/debian/kinetic/turtlebot3_gazebo
            // bfdfe370db5147f28cbd8030fbe1f0ce555c582f        refs/heads/debian/kinetic/turtlebot3_gazebo_plugin
            // 9a35739b86100625c223aa00252308c1a708acf6        refs/heads/debian/kinetic/turtlebot3_gazebo_ros
            // 070b8be9ad492a3e3f01817632f2527630941673        refs/heads/debian/kinetic/turtlebot3_simulations
            // 775673026c02cd6d608e29f267948bda0e480e2c        refs/heads/debian/kinetic/xenial/turtlebot3_fake
            // d328d91a1007da2941c2bc074219dc8cf3e28188        refs/heads/debian/kinetic/xenial/turtlebot3_gazebo
            // df72e96bc206245329f6a536a0c5845903b3ca46        refs/heads/debian/kinetic/xenial/turtlebot3_gazebo_plugin
            // 5d7113987d9354c3dcd29439d78f7265454c3bd5        refs/heads/debian/kinetic/xenial/turtlebot3_gazebo_ros
            // 8a12651d12f3cdfb33dd0909bbfd8fdee4cb10f0        refs/heads/debian/kinetic/xenial/turtlebot3_simulations
            // 0efdbc8f49eea594b6ba5aecfed9bbe37a57abd3        refs/heads/debian/melodic/artful/turtlebot3_fake
            // 8c4ccb49e4b589a9cb372afd23e5a69ba36ea8cd        refs/heads/debian/melodic/artful/turtlebot3_gazebo
            // 06fc35546e3309bd1372478f9d80513bf0f7f25f        refs/heads/debian/melodic/artful/turtlebot3_simulations
            // 0a30fc89ceb4c67baa0d60052d58977490686cf9        refs/heads/debian/melodic/bionic/turtlebot3_fake
            // e6713795b1380debefb9c2df63f0ccc71029472c        refs/heads/debian/melodic/bionic/turtlebot3_gazebo
            // 3ba7d946b5ef37003c73f4b783e3eaa373c4eb47        refs/heads/debian/melodic/bionic/turtlebot3_simulations
            // 052558c38b1b07aa10643ae8f7ac3e8bd96d0b09        refs/heads/debian/melodic/stretch/turtlebot3_fake
            // b6ebb70b1d8baeb62404d1967e8a31ee5deb9e68        refs/heads/debian/melodic/stretch/turtlebot3_gazebo
            // 86b1e8a77054ea46c11c06c5e08b01e31a11729d        refs/heads/debian/melodic/stretch/turtlebot3_simulations
            // 66a030280a9b0dea4b6ce696a7c36680dfeb8c4a        refs/heads/debian/melodic/turtlebot3_fake
            // 5c2f988241e2c0dd506f13a7679bdc850f12576e        refs/heads/debian/melodic/turtlebot3_gazebo
            // 4d9ba2c79e42df923133b6f437ff83317966d28b        refs/heads/debian/melodic/turtlebot3_simulations
            // 6dc65cd9cbb2ebbadc632e7b86784e0620c03d27        refs/heads/debian/noetic/buster/turtlebot3_fake
            // 63809b57ad1a525b27311fb7697c0db9245e42b9        refs/heads/debian/noetic/buster/turtlebot3_gazebo
            // aeff718e6bc8c052a80d3b7bcd55ea6825bd6e46        refs/heads/debian/noetic/buster/turtlebot3_simulations
            // 3f3faf0c1822b50c24bfa499c315df759994833d        refs/heads/debian/noetic/focal/turtlebot3_fake
            // 0f5553525551c66f3a46237405382a628817d223        refs/heads/debian/noetic/focal/turtlebot3_gazebo
            // ed8507659080a9b1c85d1ea9b2282d59f65096bc        refs/heads/debian/noetic/focal/turtlebot3_simulations
            // 82e5d86d5f65155370f85ad959d83ac1564cb9e0        refs/heads/debian/noetic/turtlebot3_fake
            // 05def97c12f073b163f4a5bcacca3b265bf2ab6f        refs/heads/debian/noetic/turtlebot3_gazebo
            // aa1d6c393f1dcde97389d41c54c8f7182a6267f5        refs/heads/debian/noetic/turtlebot3_simulations
            // 8cae23de85aa4ab829b18b5a9323b0d197b39a56        refs/heads/master
            // d2f317674bb4f3177a25058454377ff82e229392        refs/heads/patches/debian/kinetic/jessie/turtlebot3_fake
            // 6585bccdbb92636edb83da6f788bf3098390e050        refs/heads/patches/debian/kinetic/jessie/turtlebot3_gazebo
            // d91cfa98334a5f3884a78da448de2d4d75942b7a        refs/heads/patches/debian/kinetic/jessie/turtlebot3_gazebo_plugin
            // 8545d2a89d36013647c814707e824e154a235079        refs/heads/patches/debian/kinetic/jessie/turtlebot3_gazebo_ros
            // 3e73c29e0a394cc7337e804519a0965c40c2b6fa        refs/heads/patches/debian/kinetic/jessie/turtlebot3_simulations
            // 22fb09a694e0b846a9ceaef68420012f69508536        refs/heads/patches/debian/kinetic/turtlebot3_fake
            // eb8c5149fc541041091ecb2fc405bbe98fb7681f        refs/heads/patches/debian/kinetic/turtlebot3_gazebo
            // 324422145bd276cf45cffff5f45fca4e6223dc29        refs/heads/patches/debian/kinetic/turtlebot3_gazebo_plugin
            // e0b255284429e165e6c65be0004e544592c27812        refs/heads/patches/debian/kinetic/turtlebot3_gazebo_ros
            // 4154fa4b244490d8f61c3c20163fe799da29f62e        refs/heads/patches/debian/kinetic/turtlebot3_simulations
            // 677b16e4e6b2d5ba1219e2fc2fd182a8e7500b10        refs/heads/patches/debian/kinetic/xenial/turtlebot3_fake
            // 526a36649389dd6263b84f558ff6852695a7902d        refs/heads/patches/debian/kinetic/xenial/turtlebot3_gazebo
            // 40afe0962d87f3cc055f4b979472f432ec3bb9d9        refs/heads/patches/debian/kinetic/xenial/turtlebot3_gazebo_plugin
            // 472c7e2fe3cf772debe0187df48a87d33897d599        refs/heads/patches/debian/kinetic/xenial/turtlebot3_gazebo_ros
            // 37c71331da32bda82a6c804abae72b93d2653507        refs/heads/patches/debian/kinetic/xenial/turtlebot3_simulations
            // 26c146db2057e8c7e0bb2efefbd5ceebcf05ad32        refs/heads/patches/debian/melodic/artful/turtlebot3_fake
            // 2f3daca5a97c56ca4c4821aa41cac11195149181        refs/heads/patches/debian/melodic/artful/turtlebot3_gazebo
            // 8218f9d5721151aebf67374b232157a4f7010106        refs/heads/patches/debian/melodic/artful/turtlebot3_simulations
            // 26fe21b35a8fbef9b0bc1a02cff2bd2b97867fac        refs/heads/patches/debian/melodic/bionic/turtlebot3_fake
            // 1fd478ae462ad4a6be85b1cb422637dea84e14f5        refs/heads/patches/debian/melodic/bionic/turtlebot3_gazebo
            // 681736f2d3cde6a743a77b146f3ac486f7e05e86        refs/heads/patches/debian/melodic/bionic/turtlebot3_simulations
            // 09e69c610572fb48ea9a36ac0a9e604e49664b01        refs/heads/patches/debian/melodic/stretch/turtlebot3_fake
            // a9e88746bb45124e33012b542bb32856227eb790        refs/heads/patches/debian/melodic/stretch/turtlebot3_gazebo
            // 280a548f195aacaad3b50e8395d6088086d8019a        refs/heads/patches/debian/melodic/stretch/turtlebot3_simulations
            // 0da2ec077a0a99b1ab2a1cff2a39607231e28c3f        refs/heads/patches/debian/melodic/turtlebot3_fake
            // 44892ec87b98b0f3561f3478aaf47311410f25ef        refs/heads/patches/debian/melodic/turtlebot3_gazebo
            // 7278a1d8c57efa1928896d3b0ef826b8d0df578e        refs/heads/patches/debian/melodic/turtlebot3_simulations
            // 1fa3db57300e1e9c8f52132303dc05a1ffd16b4f        refs/heads/patches/debian/noetic/buster/turtlebot3_fake
            // 28cec1541bd0657f204a80c475331e24b6abb7e1        refs/heads/patches/debian/noetic/buster/turtlebot3_gazebo
            // 27bdce97d76091aaf9937f61210da23df5dd57df        refs/heads/patches/debian/noetic/buster/turtlebot3_simulations
            // c78d7a9991afd5be5277cbcc01458d91b7ebb0a3        refs/heads/patches/debian/noetic/focal/turtlebot3_fake
            // fb9a1d8fe93b932cdbe4f8e6672b7a560f2354cf        refs/heads/patches/debian/noetic/focal/turtlebot3_gazebo
            // a381db8f9f053474d9ab87e4b3a82990e36c1975        refs/heads/patches/debian/noetic/focal/turtlebot3_simulations
            // edf12b037dfab26be8a3e7de2327913a831e4381        refs/heads/patches/debian/noetic/turtlebot3_fake
            // bea7e38b64523bf0dc81b0ed8ae4daeab7e9e99f        refs/heads/patches/debian/noetic/turtlebot3_gazebo
            // 21be536acd1ebc9d79d232fdda50b17e0ef5b1fb        refs/heads/patches/debian/noetic/turtlebot3_simulations
            // b631bee33089e8283a0aac634d4b3b9346c3126c        refs/heads/patches/release/kinetic/turtlebot3_fake
            // 791921e6280a51ab8f34470275a7ab8439865464        refs/heads/patches/release/kinetic/turtlebot3_gazebo
            // cd60005e2dfe2c8001297e6af8b732ce4a59050a        refs/heads/patches/release/kinetic/turtlebot3_gazebo_plugin
            // f17b41ea9d2a06cd172f245f5ccca9f1dd6d819a        refs/heads/patches/release/kinetic/turtlebot3_gazebo_ros
            // aa3467d4723cd8b8f468508586e183f498ffea42        refs/heads/patches/release/kinetic/turtlebot3_simulations
            // ea88102ca83b50b57aaee14aa2b517a3856ef923        refs/heads/patches/release/melodic/turtlebot3_fake
            // b731407e5dbcf381695617bff2e2e128cfcb9b54        refs/heads/patches/release/melodic/turtlebot3_gazebo
            // d46dc84536d212fb0fe165c6bcff3771e8d99392        refs/heads/patches/release/melodic/turtlebot3_simulations
            // fd9b6a761a9395e916e8a0aab8468013249c2b1f        refs/heads/patches/release/noetic/turtlebot3_fake
            // 57e1477a1f8b4d0f4cf3c77fe21450a6b5789b4a        refs/heads/patches/release/noetic/turtlebot3_gazebo
            // 20c73b43fe4e420dd92750f35ece527e24652638        refs/heads/patches/release/noetic/turtlebot3_simulations
            // 96ab65663fb6c6a0baaef35319ab2632599a8808        refs/heads/patches/rpm/kinetic/23/turtlebot3_fake
            // a4decdf7e8a25a8d0dbbe35b18b40243bec1b62b        refs/heads/patches/rpm/kinetic/23/turtlebot3_gazebo
            // 45e9732e560e04008ef0511a781d728ee39e8c9e        refs/heads/patches/rpm/kinetic/23/turtlebot3_gazebo_plugin
            // e30809196bc6dd94a87adb4d7e9c613eaf86a844        refs/heads/patches/rpm/kinetic/23/turtlebot3_gazebo_ros
            // 4aade9db838fc7c7235494d3e05fdc79d6f9cb60        refs/heads/patches/rpm/kinetic/23/turtlebot3_simulations
            // da13180eae3c74342e1968557b2b6c9f9087922a        refs/heads/patches/rpm/kinetic/24/turtlebot3_fake
            // 05aefd0aa0252b18fe32ded4ed3dac627802146a        refs/heads/patches/rpm/kinetic/24/turtlebot3_gazebo
            // ecd38f154abc001dacce618d22875a13ac982ee2        refs/heads/patches/rpm/kinetic/24/turtlebot3_gazebo_plugin
            // cedfbfaae7bc49447ca0c4b10473f5ba0e6fdc2b        refs/heads/patches/rpm/kinetic/24/turtlebot3_gazebo_ros
            // 97180d35be83017685410abec915e8ff3e865ed7        refs/heads/patches/rpm/kinetic/24/turtlebot3_simulations
            // cf8ad8e232f69307a2b10d4d728e2d8985cbe4d5        refs/heads/patches/rpm/kinetic/turtlebot3_fake
            // 4dfe3509c72660f1d6473cf22f197c4804ad7fd0        refs/heads/patches/rpm/kinetic/turtlebot3_gazebo
            // e8882cc70ff20e40978356261b1c6d261550dd4e        refs/heads/patches/rpm/kinetic/turtlebot3_gazebo_plugin
            // 7a2192d83aad62b6a872cf610d59abb30a604cf8        refs/heads/patches/rpm/kinetic/turtlebot3_gazebo_ros
            // 719bc5c1b5b1f8733aee012e0a8f3396031e554e        refs/heads/patches/rpm/kinetic/turtlebot3_simulations
            // 94e8de9be00183bdab62b817d78d5fd8f485064b        refs/heads/patches/rpm/melodic/28/turtlebot3_fake
            // dc485164900a9539d495a1534170e3a8e77412b4        refs/heads/patches/rpm/melodic/28/turtlebot3_gazebo
            // b8a8fb3e9af516736f6d3030b833a667a3f24bc7        refs/heads/patches/rpm/melodic/28/turtlebot3_simulations
            // 7196a307af0f3a5d6874c266a113ada536e5aa0b        refs/heads/patches/rpm/melodic/turtlebot3_fake
            // 949372a83185285611138eb33843ac8b2f686eeb        refs/heads/patches/rpm/melodic/turtlebot3_gazebo
            // 4ea464ae1feb39f67eee25ca279702d39ff9eca2        refs/heads/patches/rpm/melodic/turtlebot3_simulations
            // d1ecd482617b4817d951cf5abfe5ddc50470ee54        refs/heads/patches/rpm/noetic/32/turtlebot3_fake
            // 265429aad43eda89be9f53d27a04d9f4b002d5e8        refs/heads/patches/rpm/noetic/32/turtlebot3_gazebo
            // 5a665a5059a08c9999b0fc5b126001bba1724fbf        refs/heads/patches/rpm/noetic/32/turtlebot3_simulations
            // 9592d3cef52edb94d39874fd00a8c2ef164824f1        refs/heads/patches/rpm/noetic/turtlebot3_fake
            // 3856a28016ab805f6584c38e109a45249f5ad956        refs/heads/patches/rpm/noetic/turtlebot3_gazebo
            // a6840f9f9e3fae4c715709b43edd6c9848de476c        refs/heads/patches/rpm/noetic/turtlebot3_simulations
            // 0bb01346ad5be15f2b688bba5f750531597f1bef        refs/heads/release/kinetic/turtlebot3_fake
            // 4d76945f12bae07d22cee4116beabb2b7116e7c7        refs/heads/release/kinetic/turtlebot3_gazebo
            // 7bee09c4c8f2e2f67a024bc293ed9c2c9c3abc81        refs/heads/release/kinetic/turtlebot3_gazebo_plugin
            // 9698b3214794f423d4e8390c297b823f7e793743        refs/heads/release/kinetic/turtlebot3_gazebo_ros
            // dd7cec924544e3e951496944be640f0e52245ad3        refs/heads/release/kinetic/turtlebot3_simulations
            // 93877f9506470244896215af41a8cdab7576a729        refs/heads/release/melodic/turtlebot3_fake
            // dea469d1bce7ceb5bceb45314efc9555c6d7fdca        refs/heads/release/melodic/turtlebot3_gazebo
            // 29aaae4b1c0abdb6ec58f6e66cf2622f84113812        refs/heads/release/melodic/turtlebot3_simulations
            // 27d4735a0e13ac682f715ecaa09d4d6abc8fb893        refs/heads/release/noetic/turtlebot3_fake
            // 673ac06187511d604238638f65cff92736cfbd3b        refs/heads/release/noetic/turtlebot3_gazebo
            // d1553d785b755f2d3a86568794f597c511ec6168        refs/heads/release/noetic/turtlebot3_simulations
            // 7e1b6b91d0e2b92e0618383fc9ae881fc50f26cb        refs/heads/rpm/kinetic/23/turtlebot3_fake
            // 757e97f47c10179a56c467ceacd807f340de1790        refs/heads/rpm/kinetic/23/turtlebot3_gazebo
            // ea13e90cdf89305a11e3bdf5072f5b86d548a216        refs/heads/rpm/kinetic/23/turtlebot3_gazebo_plugin
            // 846f7ec9a01c94ed2f3c8a64bbebd9310ba008a7        refs/heads/rpm/kinetic/23/turtlebot3_gazebo_ros
            // d4d52e374ce6b9757d76156e235ed28af5f4bd3b        refs/heads/rpm/kinetic/23/turtlebot3_simulations
            // b3b0142b631f3915e4b93fb10d58a675f3f4aad2        refs/heads/rpm/kinetic/24/turtlebot3_fake
            // 9c54e60dcafda61cf57b70c52e73527bc9ea4d78        refs/heads/rpm/kinetic/24/turtlebot3_gazebo
            // b406960b73cd2f0d2c1dc163d3a1cbb777181bad        refs/heads/rpm/kinetic/24/turtlebot3_gazebo_plugin
            // 864158c9fce6c6e1e4d1eb6e1e87e50cee2fb58f        refs/heads/rpm/kinetic/24/turtlebot3_gazebo_ros
            // e1e93f55c23c5393ba04c2b07c601cce14056655        refs/heads/rpm/kinetic/24/turtlebot3_simulations
            // 060919b9543ab09d4f1181c12e213b60f1b6936a        refs/heads/rpm/kinetic/turtlebot3_fake
            // fe14f8e68e355c16a29e1450a091f0bbed428f0f        refs/heads/rpm/kinetic/turtlebot3_gazebo
            // ce27e97ae8c744b2d9e79ef74ce37ffdbdaf9254        refs/heads/rpm/kinetic/turtlebot3_gazebo_plugin
            // b8f7ec93c160b9b9483a003cc6c5e0e0aaea50e5        refs/heads/rpm/kinetic/turtlebot3_gazebo_ros
            // efa1f80d0af4801109a5dd3b4478427253484f95        refs/heads/rpm/kinetic/turtlebot3_simulations
            // 8369e021d0e510e3a538c9ef8e8c88f040b2d5cd        refs/heads/rpm/melodic/28/turtlebot3_fake
            // 0d9ae06f2d64b20a696ce7ce83e997e13c2b64d8        refs/heads/rpm/melodic/28/turtlebot3_gazebo
            // db1fbaf00e2c27bd38f60cc8124abf1493ce5409        refs/heads/rpm/melodic/28/turtlebot3_simulations
            // aaf470dea94e0dab44aa6d63a357d71138fa6570        refs/heads/rpm/melodic/turtlebot3_fake
            // 60b334468a19e1f891716221ac5f874c4aaf7eb5        refs/heads/rpm/melodic/turtlebot3_gazebo
            // c0048c56019caa5688feb564b8c3dfa0c72d2b2f        refs/heads/rpm/melodic/turtlebot3_simulations
            // b655beaed83b37aa1e201d486df0b923e79a90fe        refs/heads/rpm/noetic/32/turtlebot3_fake
            // 2b54167f5b40e362cd3b38478e96b4a5e7e400a3        refs/heads/rpm/noetic/32/turtlebot3_gazebo
            // 228049a5e3467982e803fe0372f601dba0a3609a        refs/heads/rpm/noetic/32/turtlebot3_simulations
            // 9cabd9e537b481ccb40faeca7c9d6d6743b54bf5        refs/heads/rpm/noetic/turtlebot3_fake
            // bc2ee96f7fdcf90b2d411f14671c197f54bf334a        refs/heads/rpm/noetic/turtlebot3_gazebo
            // 3664991cf256d61ee94523f668e972721475d486        refs/heads/rpm/noetic/turtlebot3_simulations
            // 54881640297504b28a4e832d5ce55a53124d75c7        refs/heads/upstream
            // c199d9e1f782d939d7d36b6cf01a9f372041275e        refs/tags/debian/ros-kinetic-turtlebot3-fake_0.1.4-0_jessie
            // ee3bc1f2e57121af82e7db116106008d9a6007b8        refs/tags/debian/ros-kinetic-turtlebot3-fake_0.1.4-0_xenial
            // 5d3c38e9b28fad7a840de9f9441d509c5653fa52        refs/tags/debian/ros-kinetic-turtlebot3-fake_0.1.4-1_jessie
            // 74a810292636b5b2d5ed8b4949a7696f9a455aa4        refs/tags/debian/ros-kinetic-turtlebot3-fake_0.1.4-1_xenial
            // 98b2ceace11b11ea483fdc7f2330479bb008823a        refs/tags/debian/ros-kinetic-turtlebot3-fake_0.1.5-0_jessie
            // 4b8a954c2d2d048e2be9e96d00cc8b0e6e1307d5        refs/tags/debian/ros-kinetic-turtlebot3-fake_0.1.5-0_xenial
            // b89e8b52507d053016c7ed171e40949f3352d5e0        refs/tags/debian/ros-kinetic-turtlebot3-fake_0.1.6-0_jessie
            // 2e5f4cec041e1c524c5d83e78e0f73d3ed52cd74        refs/tags/debian/ros-kinetic-turtlebot3-fake_0.1.6-0_xenial
            // 28d3dc20d0d26b9a6bdbc06bb757ef9f89f09f4d        refs/tags/debian/ros-kinetic-turtlebot3-fake_0.1.7-0_jessie
            // af45fa49d15831d1d36c1da8af1cb77e88ec35dc        refs/tags/debian/ros-kinetic-turtlebot3-fake_0.1.7-0_xenial
            // 759457ebd6346c6f08feea1f1eb623a51eeca285        refs/tags/debian/ros-kinetic-turtlebot3-fake_0.2.0-0_jessie
            // aa62c9232cb6762bbf2b1df8890125c2a91d7650        refs/tags/debian/ros-kinetic-turtlebot3-fake_0.2.0-0_xenial
            // f320b1d6736025c17de3fa5431d7f7b73b92a289        refs/tags/debian/ros-kinetic-turtlebot3-fake_0.2.4-0_jessie
            // df5e5dca0abcf8f31a2d3bd154d06d3b345790f1        refs/tags/debian/ros-kinetic-turtlebot3-fake_0.2.4-0_xenial
            // 6c5bfdec325b823f122779d1384ab05e172fa059        refs/tags/debian/ros-kinetic-turtlebot3-fake_1.0.0-0_jessie
            // c1973432992a16a535c02d9df370a480ecfcbff1        refs/tags/debian/ros-kinetic-turtlebot3-fake_1.0.0-0_xenial
            // 2f3e2219b4eb6aa4b773383a20e0b079997bfe5d        refs/tags/debian/ros-kinetic-turtlebot3-fake_1.0.0-1_jessie
            // ea91c7892657455faea87033ae1e6241190d4b94        refs/tags/debian/ros-kinetic-turtlebot3-fake_1.0.0-1_xenial
            // 48a66475d39f48b15dbffcaf89bcecf247b72118        refs/tags/debian/ros-kinetic-turtlebot3-fake_1.0.0-2_jessie
            // ae38f1bd29f3ce88a2c5ef4e6079dff50fb0ef4e        refs/tags/debian/ros-kinetic-turtlebot3-fake_1.0.0-2_xenial
            // baaa44fdaa83f1ddebb2af2160230fd834d10ebf        refs/tags/debian/ros-kinetic-turtlebot3-fake_1.0.1-0_jessie
            // be64290765a0071602ef77ee01189b4e16c5bbf9        refs/tags/debian/ros-kinetic-turtlebot3-fake_1.0.1-0_xenial
            // aba9ee0404aa7263aa84af402965d678974f5a1e        refs/tags/debian/ros-kinetic-turtlebot3-fake_1.0.2-0_jessie
            // 8f071a0433946c0919b2401d3f53a0c5f287af73        refs/tags/debian/ros-kinetic-turtlebot3-fake_1.0.2-0_xenial
            // 8bd741b0adea12a36925107ae7250f7a2b64bac2        refs/tags/debian/ros-kinetic-turtlebot3-fake_1.1.0-0_xenial
            // f5f33f627b26c4b41026f09a5e46a005a6484e37        refs/tags/debian/ros-kinetic-turtlebot3-fake_1.2.0-0_xenial
            // 775673026c02cd6d608e29f267948bda0e480e2c        refs/tags/debian/ros-kinetic-turtlebot3-fake_1.3.1-1_xenial
            // 5e0271f1af1d744648b92846c6ee43a7fbb4f491        refs/tags/debian/ros-kinetic-turtlebot3-gazebo-plugin_0.2.0-0_jessie
            // df72e96bc206245329f6a536a0c5845903b3ca46        refs/tags/debian/ros-kinetic-turtlebot3-gazebo-plugin_0.2.0-0_xenial
            // dd829bf5625c0cefcb286e834a977494fb4a8116        refs/tags/debian/ros-kinetic-turtlebot3-gazebo-ros_0.2.0-0_jessie
            // 5267a91e49ab33de18274d44a752062491101103        refs/tags/debian/ros-kinetic-turtlebot3-gazebo-ros_0.2.0-0_xenial
            // 72011798b3df092c05c7d3894ff90826f679e317        refs/tags/debian/ros-kinetic-turtlebot3-gazebo-ros_0.2.4-0_jessie
            // b1aa765521474d6b5492c33b46d4209ea7b0a42c        refs/tags/debian/ros-kinetic-turtlebot3-gazebo-ros_0.2.4-0_xenial
            // 5d7113987d9354c3dcd29439d78f7265454c3bd5        refs/tags/debian/ros-kinetic-turtlebot3-gazebo-ros_0.2.4-1_xenial
            // 42f26ad4248e2456b8ed59d3e81eeca02aa121ae        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_0.1.4-0_jessie
            // c9863f6cca7c5832605f205a348cd0992ffcabd2        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_0.1.4-0_xenial
            // 3bdf752b911cff23012e38bbcf5aee317c7b6526        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_0.1.4-1_jessie
            // ae0894f2e0da24fbda31755a8f76f5319f48fc57        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_0.1.4-1_xenial
            // c0f2de383359625074b23e76c8921d9d4efda889        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_0.1.5-0_jessie
            // 9b3bc798ff6ea91befd2c572d1c9805158e255b9        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_0.1.5-0_xenial
            // 9e96708e3bd6c27d382e8d6e0976dbd11755474f        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_0.1.6-0_jessie
            // 7d2558791453220fe6160e119653a9866d0b61fa        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_0.1.6-0_xenial
            // 53e5655e8fd0b19dab1ce03bc54ac527b76e972d        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_0.1.7-0_jessie
            // 87f18e6b117fbd4606deaa0555cb0efce65dad49        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_0.1.7-0_xenial
            // 24c77268e6b6892f592532c8277d3a873ecca00f        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_1.0.0-0_jessie
            // 79596bd1daf5d1cd1f767f26e9e3cfac6d5edc7a        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_1.0.0-0_xenial
            // 51a43388582e22fd600ab6d273f6716c15327c41        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_1.0.0-1_jessie
            // e6a3110de8cb88344a6a614b6d9dfdab17f3a011        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_1.0.0-1_xenial
            // 5520c1ea2b1857efd4f69d2ce3981698d3c3b3d6        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_1.0.0-2_jessie
            // 94d0ae5ae8181ff7c1ab133338381fd584747e69        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_1.0.0-2_xenial
            // 2102de04ef8e70fbd52fc7093baa3831b5dcb941        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_1.0.1-0_jessie
            // 4550f61c9f4183b39ab0171a44dd2f0ba4902f9c        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_1.0.1-0_xenial
            // 418771c5068cacf8fafd614a7f02e07ad5c74301        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_1.0.2-0_jessie
            // dc701b58a46c7f8a8c929bb78b4e8193371150f4        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_1.0.2-0_xenial
            // 06c9c3d8c29cefe786147bac2e17e6e262d6ef7e        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_1.1.0-0_xenial
            // 91af6de3c227312865322061974f36d404e0f8ed        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_1.2.0-0_xenial
            // d328d91a1007da2941c2bc074219dc8cf3e28188        refs/tags/debian/ros-kinetic-turtlebot3-gazebo_1.3.1-1_xenial
            // 5a338450f5ba5cb330772d44ff6b6e52343a4bd6        refs/tags/debian/ros-kinetic-turtlebot3-simulations_0.1.4-0_jessie
            // 454ba9b43c8ede6954829948c93aebe19ae373a0        refs/tags/debian/ros-kinetic-turtlebot3-simulations_0.1.4-0_xenial
            // 1299a3a1008146fe41e80c3d30d770a32f98686b        refs/tags/debian/ros-kinetic-turtlebot3-simulations_0.1.4-1_jessie
            // 55d5a5b76c99fbd2db3dcff4ef5b26bbaab3aeff        refs/tags/debian/ros-kinetic-turtlebot3-simulations_0.1.4-1_xenial
            // 644c58a38da4997835bb39262cca76b63116a743        refs/tags/debian/ros-kinetic-turtlebot3-simulations_0.1.5-0_jessie
            // f8863f4d5856e6cd6546f4abc8930428dce65dea        refs/tags/debian/ros-kinetic-turtlebot3-simulations_0.1.5-0_xenial
            // f4df2deb4d82cfb081fd6d6b7e94101f788e7d29        refs/tags/debian/ros-kinetic-turtlebot3-simulations_0.1.6-0_jessie
            // 039408deccc7ff485566e56a89bbbf995f51bf09        refs/tags/debian/ros-kinetic-turtlebot3-simulations_0.1.6-0_xenial
            // 0f9c79aff231848ddacf9d39183cfc9810ecb1c8        refs/tags/debian/ros-kinetic-turtlebot3-simulations_0.1.7-0_jessie
            // fe4f8f5ee8d7e484681c9f757433402c83d8ff97        refs/tags/debian/ros-kinetic-turtlebot3-simulations_0.1.7-0_xenial
            // 460fab1c9b0f63a11d68c39600a47538cd6808d7        refs/tags/debian/ros-kinetic-turtlebot3-simulations_0.2.0-0_jessie
            // 2b4c389f742940308119f4295fb183bcca985194        refs/tags/debian/ros-kinetic-turtlebot3-simulations_0.2.0-0_xenial
            // 907e97ffee01ebab399eacbbcc4291fbb8e7c03a        refs/tags/debian/ros-kinetic-turtlebot3-simulations_0.2.4-0_jessie
            // 1f010bf2fb7a252014b2b0a953ccbad1f9fdec55        refs/tags/debian/ros-kinetic-turtlebot3-simulations_0.2.4-0_xenial
            // 1189ff362543eb399d9426abba3a479f32037168        refs/tags/debian/ros-kinetic-turtlebot3-simulations_1.0.0-0_jessie
            // c5800a4819e37e9566e239894708db78c35b52bb        refs/tags/debian/ros-kinetic-turtlebot3-simulations_1.0.0-0_xenial
            // 8a565c2d7ae4b5aa669107ea4b3d573e077c1203        refs/tags/debian/ros-kinetic-turtlebot3-simulations_1.0.0-1_jessie
            // 3afd8949f4d9e72b91ee1f0349ed30885b7df450        refs/tags/debian/ros-kinetic-turtlebot3-simulations_1.0.0-1_xenial
            // 7c0d23c3af0226e5ab878421dd1b3795825fe22f        refs/tags/debian/ros-kinetic-turtlebot3-simulations_1.0.0-2_jessie
            // 6b4cc09ccaee2ff0c0fba7408afd265f04f44d56        refs/tags/debian/ros-kinetic-turtlebot3-simulations_1.0.0-2_xenial
            // da661c7ed0d760752f74eb45e9f1ffbc13935fdb        refs/tags/debian/ros-kinetic-turtlebot3-simulations_1.0.1-0_jessie
            // 5afe9e6dc1e5922f2ab3259d8db5e7e1ea280dc4        refs/tags/debian/ros-kinetic-turtlebot3-simulations_1.0.1-0_xenial
            // d6b822a9065a4cd75291389157ff78e7741a472e        refs/tags/debian/ros-kinetic-turtlebot3-simulations_1.0.2-0_jessie
            // 6183e729f914777a742990ffb4202ab67ebcf428        refs/tags/debian/ros-kinetic-turtlebot3-simulations_1.0.2-0_xenial
            // c783c781a3af589734478fde269ef75ef65fa1ad        refs/tags/debian/ros-kinetic-turtlebot3-simulations_1.1.0-0_xenial
            // 2c045ba9bd4119ad4066ecf1eb9ec24d63cc65bd        refs/tags/debian/ros-kinetic-turtlebot3-simulations_1.2.0-0_xenial
            // 8a12651d12f3cdfb33dd0909bbfd8fdee4cb10f0        refs/tags/debian/ros-kinetic-turtlebot3-simulations_1.3.1-1_xenial
            // 0efdbc8f49eea594b6ba5aecfed9bbe37a57abd3        refs/tags/debian/ros-melodic-turtlebot3-fake_1.1.0-0_artful
            // e65bdc408dd18124a4e8503fe46c75b8b4dbaa78        refs/tags/debian/ros-melodic-turtlebot3-fake_1.1.0-0_bionic
            // 20bb9ecba848f4124b8473ee350ce3b23dc7ce1b        refs/tags/debian/ros-melodic-turtlebot3-fake_1.1.0-0_stretch
            // ebed2f39a607d7ca3e5180f0639970b5672d023b        refs/tags/debian/ros-melodic-turtlebot3-fake_1.2.0-0_bionic
            // 052558c38b1b07aa10643ae8f7ac3e8bd96d0b09        refs/tags/debian/ros-melodic-turtlebot3-fake_1.2.0-0_stretch
            // 5b121821f5bf2b24890486d813e4ccff617c330a        refs/tags/debian/ros-melodic-turtlebot3-fake_1.3.1-1_bionic
            // 0a30fc89ceb4c67baa0d60052d58977490686cf9        refs/tags/debian/ros-melodic-turtlebot3-fake_1.3.2-1_bionic
            // 8c4ccb49e4b589a9cb372afd23e5a69ba36ea8cd        refs/tags/debian/ros-melodic-turtlebot3-gazebo_1.1.0-0_artful
            // 4626b7eb9b59840eb1aeeb27c1bd083de877f29a        refs/tags/debian/ros-melodic-turtlebot3-gazebo_1.1.0-0_bionic
            // 84f1bc61d686be9044607b5cbea3078042f1f208        refs/tags/debian/ros-melodic-turtlebot3-gazebo_1.1.0-0_stretch
            // fd1dc67cd699071901a522a6342305e4c76e3689        refs/tags/debian/ros-melodic-turtlebot3-gazebo_1.2.0-0_bionic
            // b6ebb70b1d8baeb62404d1967e8a31ee5deb9e68        refs/tags/debian/ros-melodic-turtlebot3-gazebo_1.2.0-0_stretch
            // 1a7b63af9511091180b9782420584fd14b6338ac        refs/tags/debian/ros-melodic-turtlebot3-gazebo_1.3.1-1_bionic
            // e6713795b1380debefb9c2df63f0ccc71029472c        refs/tags/debian/ros-melodic-turtlebot3-gazebo_1.3.2-1_bionic
            // 06fc35546e3309bd1372478f9d80513bf0f7f25f        refs/tags/debian/ros-melodic-turtlebot3-simulations_1.1.0-0_artful
            // fa030550e1542d8bc81484cb36a228b80e9e4f23        refs/tags/debian/ros-melodic-turtlebot3-simulations_1.1.0-0_bionic
            // fa13e9786856ae976f9dd89b3fa9526d71f22e96        refs/tags/debian/ros-melodic-turtlebot3-simulations_1.1.0-0_stretch
            // c01f55e4f32457134a6140b8ffb03884aa17d760        refs/tags/debian/ros-melodic-turtlebot3-simulations_1.2.0-0_bionic
            // 86b1e8a77054ea46c11c06c5e08b01e31a11729d        refs/tags/debian/ros-melodic-turtlebot3-simulations_1.2.0-0_stretch
            // 04e8cb610b209474177f7856b10c8ba2f3255de1        refs/tags/debian/ros-melodic-turtlebot3-simulations_1.3.1-1_bionic
            // 3ba7d946b5ef37003c73f4b783e3eaa373c4eb47        refs/tags/debian/ros-melodic-turtlebot3-simulations_1.3.2-1_bionic
            // 64c719482bd401c2c46a5be4fa002a42d06c3f85        refs/tags/debian/ros-noetic-turtlebot3-fake_1.3.1-1_buster
            // 5f450e5e32ea825f61ec851acd82b72decaf8a78        refs/tags/debian/ros-noetic-turtlebot3-fake_1.3.1-1_focal
            // d8e9323f12736c8813a2346c6c6253f538acd43f        refs/tags/debian/ros-noetic-turtlebot3-fake_1.3.2-1_buster
            // 0eb5ca1bc95de51ca624cb109561f11708410047        refs/tags/debian/ros-noetic-turtlebot3-fake_1.3.2-1_focal
            // 6dc65cd9cbb2ebbadc632e7b86784e0620c03d27        refs/tags/debian/ros-noetic-turtlebot3-fake_1.3.2-2_buster
            // 3f3faf0c1822b50c24bfa499c315df759994833d        refs/tags/debian/ros-noetic-turtlebot3-fake_1.3.2-2_focal
            // 86b22cb44c52cf0a20bfca403e2c35dc5b12c1da        refs/tags/debian/ros-noetic-turtlebot3-gazebo_1.3.1-1_buster
            // 14c955fdb426a460688e960b5b0e9d1d4e3e9a32        refs/tags/debian/ros-noetic-turtlebot3-gazebo_1.3.1-1_focal
            // 7de8433fe2d6ea870b9be6febb5e32c4b788702c        refs/tags/debian/ros-noetic-turtlebot3-gazebo_1.3.2-1_buster
            // 122d6a6d4541a73e38cddcaa55334c21c8cdd369        refs/tags/debian/ros-noetic-turtlebot3-gazebo_1.3.2-1_focal
            // 63809b57ad1a525b27311fb7697c0db9245e42b9        refs/tags/debian/ros-noetic-turtlebot3-gazebo_1.3.2-2_buster
            // 0f5553525551c66f3a46237405382a628817d223        refs/tags/debian/ros-noetic-turtlebot3-gazebo_1.3.2-2_focal
            // fc7de9a6d3057d03c5522fa1b9269a98aa2f6d2a        refs/tags/debian/ros-noetic-turtlebot3-simulations_1.3.1-1_buster
            // 79c3ffaddfeaefc0e4f36a3980ede53ac74e7fe4        refs/tags/debian/ros-noetic-turtlebot3-simulations_1.3.1-1_focal
            // 2975fc6856cabc452126f0ff0f9119fe9803101d        refs/tags/debian/ros-noetic-turtlebot3-simulations_1.3.2-1_buster
            // 047c902791e5d3f94d39b6fe776e0dc0ff9b7b5d        refs/tags/debian/ros-noetic-turtlebot3-simulations_1.3.2-1_focal
            // aeff718e6bc8c052a80d3b7bcd55ea6825bd6e46        refs/tags/debian/ros-noetic-turtlebot3-simulations_1.3.2-2_buster
            // ed8507659080a9b1c85d1ea9b2282d59f65096bc        refs/tags/debian/ros-noetic-turtlebot3-simulations_1.3.2-2_focal
            // 5863a03e70c40e985a08849bb069a56bca447f6d        refs/tags/release/kinetic/turtlebot3_fake/0.1.4-0
            // 49f57e4559bff183de156e474f61be729a69953d        refs/tags/release/kinetic/turtlebot3_fake/0.1.4-1
            // 3ae721b33354cabf02684261f6b8b6d235a47431        refs/tags/release/kinetic/turtlebot3_fake/0.1.5-0
            // 344aab357cc807a8e088144da7c16538f3b0e658        refs/tags/release/kinetic/turtlebot3_fake/0.1.6-0
            // 84b6c53aaf9406b71c216d811e1e661a07386061        refs/tags/release/kinetic/turtlebot3_fake/0.1.7-0
            // 9a15036e094ad541b1dd0c98577ea22cd365ae83        refs/tags/release/kinetic/turtlebot3_fake/0.2.0-0
            // ef738e603455762874e410bb9b38da4124d3487e        refs/tags/release/kinetic/turtlebot3_fake/0.2.4-0
            // 0a612484ee096c40933eafaf35c4769368c63905        refs/tags/release/kinetic/turtlebot3_fake/1.0.0-0
            // 8a8984a4c6d6b5c941364deb925800a864b82391        refs/tags/release/kinetic/turtlebot3_fake/1.0.0-1
            // 7353f0ac4cac8c4f71649c5b9732380ce478392b        refs/tags/release/kinetic/turtlebot3_fake/1.0.0-2
            // 3bb20f1234714d2c506642a250053a18e99aec97        refs/tags/release/kinetic/turtlebot3_fake/1.0.1-0
            // 0c4de2ac7dfe8509e36047c91b388e64035cba72        refs/tags/release/kinetic/turtlebot3_fake/1.0.2-0
            // de2f9d4961c160e00bfd81db4d345cd1108844fc        refs/tags/release/kinetic/turtlebot3_fake/1.1.0-0
            // beecfdd5bdd0b9874a22944493b55697a3a35bea        refs/tags/release/kinetic/turtlebot3_fake/1.2.0-0
            // 0bb01346ad5be15f2b688bba5f750531597f1bef        refs/tags/release/kinetic/turtlebot3_fake/1.3.1-1
            // e04c21561f680ec1e48d3ada6ceffac6598dee27        refs/tags/release/kinetic/turtlebot3_gazebo/0.1.4-0
            // 728661d787bb10181c1fd8bbd7b49465308ee90f        refs/tags/release/kinetic/turtlebot3_gazebo/0.1.4-1
            // 7db82f7e474b43b09167302db282081a734d8b77        refs/tags/release/kinetic/turtlebot3_gazebo/0.1.5-0
            // fdb3d2ee362aba7f26b01250b42192bcd62de720        refs/tags/release/kinetic/turtlebot3_gazebo/0.1.6-0
            // edc590fe8f2ed38204a1b24045c3a89fd20f44e0        refs/tags/release/kinetic/turtlebot3_gazebo/0.1.7-0
            // 52fa1de2d9274476d536d50045098d8073176e97        refs/tags/release/kinetic/turtlebot3_gazebo/1.0.0-0
            // 637bf3675ecfc0258cebc1bfbdceb02501255ae4        refs/tags/release/kinetic/turtlebot3_gazebo/1.0.0-1
            // 073bdf7cb12c29e6fe5bf2c5ab9c61bf8e9c1da3        refs/tags/release/kinetic/turtlebot3_gazebo/1.0.0-2
            // c107360552fd2735783d632e5338e781656516c1        refs/tags/release/kinetic/turtlebot3_gazebo/1.0.1-0
            // 64d59ec922cfc637e2dc2823ff9e8be182eac860        refs/tags/release/kinetic/turtlebot3_gazebo/1.0.2-0
            // 772beefa0e8b4ded2cba58b8919909be473d3fe5        refs/tags/release/kinetic/turtlebot3_gazebo/1.1.0-0
            // f651ae6c658ebfcfed75f309a2f91b65baf4d37a        refs/tags/release/kinetic/turtlebot3_gazebo/1.2.0-0
            // 4d76945f12bae07d22cee4116beabb2b7116e7c7        refs/tags/release/kinetic/turtlebot3_gazebo/1.3.1-1
            // 7bee09c4c8f2e2f67a024bc293ed9c2c9c3abc81        refs/tags/release/kinetic/turtlebot3_gazebo_plugin/0.2.0-0
            // cf89e9deb2d2536cae6bae6252f03247044f0f7b        refs/tags/release/kinetic/turtlebot3_gazebo_ros/0.2.0-0
            // 9698b3214794f423d4e8390c297b823f7e793743        refs/tags/release/kinetic/turtlebot3_gazebo_ros/0.2.4-0
            // f3c2a0467290a5d5a5bfa53a66905347fce1dbfe        refs/tags/release/kinetic/turtlebot3_simulations/0.1.4-0
            // 515b900193283a65727d0a179684d2524417ee24        refs/tags/release/kinetic/turtlebot3_simulations/0.1.4-1
            // 0964e89c4f7df8a122f4b4f23079113ad4d81a39        refs/tags/release/kinetic/turtlebot3_simulations/0.1.5-0
            // 631c163beb67e5ac4be63a39bd1d27d2a419c854        refs/tags/release/kinetic/turtlebot3_simulations/0.1.6-0
            // 4284ff15a614e215d90755a19003c77b7cf9fdb6        refs/tags/release/kinetic/turtlebot3_simulations/0.1.7-0
            // 63d5785c045e047c4075d1374fae58094b18db4b        refs/tags/release/kinetic/turtlebot3_simulations/0.2.0-0
            // b98af4b24de6d221d5546a6de813b768bec3ce09        refs/tags/release/kinetic/turtlebot3_simulations/0.2.4-0
            // 81b33b94ee32aaeb931b3811a3e58b68e732ecbf        refs/tags/release/kinetic/turtlebot3_simulations/1.0.0-0
            // ffac1ea3697457dd9a542329bc194d2e15077a9a        refs/tags/release/kinetic/turtlebot3_simulations/1.0.0-1
            // abc5c06fbb5b5c598538f4154b3e368e097717c4        refs/tags/release/kinetic/turtlebot3_simulations/1.0.0-2
            // 013f75080c27a5b5b7ce747f70a95daab341e9a4        refs/tags/release/kinetic/turtlebot3_simulations/1.0.1-0
            // 9ab0c8cc04af9de716ca8e5b425b400d518e26ab        refs/tags/release/kinetic/turtlebot3_simulations/1.0.2-0
            // d29fbe839470e5d74c10832644bca002bccd5782        refs/tags/release/kinetic/turtlebot3_simulations/1.1.0-0
            // 67c426dc412c31b87fac052b424848532146523e        refs/tags/release/kinetic/turtlebot3_simulations/1.2.0-0
            // dd7cec924544e3e951496944be640f0e52245ad3        refs/tags/release/kinetic/turtlebot3_simulations/1.3.1-1
            // 8c0755275aff8667783c83f6b5cd6e897dfff1f5        refs/tags/release/melodic/turtlebot3_fake/1.1.0-0
            // 0c5a8e26313feea0fef7ff4f1971a390c484e73b        refs/tags/release/melodic/turtlebot3_fake/1.2.0-0
            // 3ce703911bb9ed87f3788ab914ac2f53f4dd2e09        refs/tags/release/melodic/turtlebot3_fake/1.3.1-1
            // 93877f9506470244896215af41a8cdab7576a729        refs/tags/release/melodic/turtlebot3_fake/1.3.2-1
            // c30b02d13e20cacc133535b9023dbec6308eb5f7        refs/tags/release/melodic/turtlebot3_gazebo/1.1.0-0
            // 327170294a905df4d38f0cea7c7e164d60d30ca8        refs/tags/release/melodic/turtlebot3_gazebo/1.2.0-0
            // a2217b0f8671c5fb226344602343c513b8961106        refs/tags/release/melodic/turtlebot3_gazebo/1.3.1-1
            // dea469d1bce7ceb5bceb45314efc9555c6d7fdca        refs/tags/release/melodic/turtlebot3_gazebo/1.3.2-1
            // 6b5f123379768b7c4ace25af65a8e764cca26c48        refs/tags/release/melodic/turtlebot3_simulations/1.1.0-0
            // c348da3a24b5e00df4b97c86dbdb1c0674c3284a        refs/tags/release/melodic/turtlebot3_simulations/1.2.0-0
            // 507262502c8cbc72fed2a03bfcae66cdd6b4fa60        refs/tags/release/melodic/turtlebot3_simulations/1.3.1-1
            // 29aaae4b1c0abdb6ec58f6e66cf2622f84113812        refs/tags/release/melodic/turtlebot3_simulations/1.3.2-1
            // 1a8439186fa46d814d839a9174c380018137a464        refs/tags/release/noetic/turtlebot3_fake/1.3.1-1
            // e8f4ecf85382c4e3fe24464fd8fb60bbb798a693        refs/tags/release/noetic/turtlebot3_fake/1.3.2-1
            // 27d4735a0e13ac682f715ecaa09d4d6abc8fb893        refs/tags/release/noetic/turtlebot3_fake/1.3.2-2
            // b0a0aad0a4636564d0a051a9de1d7974b166567c        refs/tags/release/noetic/turtlebot3_gazebo/1.3.1-1
            // 968f721902088d35d86b48c26af0619a2cc25aab        refs/tags/release/noetic/turtlebot3_gazebo/1.3.2-1
            // 673ac06187511d604238638f65cff92736cfbd3b        refs/tags/release/noetic/turtlebot3_gazebo/1.3.2-2
            // 7fcfbcb81d1b636c079397036b52e51f18163192        refs/tags/release/noetic/turtlebot3_simulations/1.3.1-1
            // adb0fd39027e2bd85f6f1c133fb1cb923006e7b5        refs/tags/release/noetic/turtlebot3_simulations/1.3.2-1
            // d1553d785b755f2d3a86568794f597c511ec6168        refs/tags/release/noetic/turtlebot3_simulations/1.3.2-2
            // 4cfb22b5a904d64fa826d835e376bc6d4b148685        refs/tags/rpm/ros-kinetic-turtlebot3-fake-0.1.4-0_23
            // 4f65bbf56b808a762edb65a2ec77ce723b0a20bb        refs/tags/rpm/ros-kinetic-turtlebot3-fake-0.1.4-0_24
            // 47f3045f77dd52c84c4d95ba6df53d1c9408ba05        refs/tags/rpm/ros-kinetic-turtlebot3-fake-0.1.4-1_23
            // 1cc41502a1096482a663173573becc9b45e0c41b        refs/tags/rpm/ros-kinetic-turtlebot3-fake-0.1.4-1_24
            // a836cf4d9225518d008b88e80105db86972c1453        refs/tags/rpm/ros-kinetic-turtlebot3-fake-0.1.5-0_23
            // a353e3c80b019c2f9a536087dece4e82a2fa46fd        refs/tags/rpm/ros-kinetic-turtlebot3-fake-0.1.5-0_24
            // 9cb3e4c3a274b27d927ffc3ffac266044a715f46        refs/tags/rpm/ros-kinetic-turtlebot3-fake-0.1.6-0_23
            // 102a51e4d11639dc77d3651334fb17e6e0d13e22        refs/tags/rpm/ros-kinetic-turtlebot3-fake-0.1.6-0_24
            // 6d81c7a301a938c135c9a65bc16fd1212038e755        refs/tags/rpm/ros-kinetic-turtlebot3-fake-0.1.7-0_23
            // 364d757a8bb6e753bef0cb4c609105ba3ab3d577        refs/tags/rpm/ros-kinetic-turtlebot3-fake-0.1.7-0_24
            // 317e54ff16086f4e990e15dec14678104a800410        refs/tags/rpm/ros-kinetic-turtlebot3-fake-0.2.0-0_23
            // 7df3c9da206a77ad5fdf648d3229d2ec7aff48c4        refs/tags/rpm/ros-kinetic-turtlebot3-fake-0.2.0-0_24
            // 8b64c1ad08cb94b2057fff939dbebc95e6eb0962        refs/tags/rpm/ros-kinetic-turtlebot3-fake-0.2.4-0_23
            // 9d7ccbd729ef6a87f964ad5ed31be65b26cf9f2c        refs/tags/rpm/ros-kinetic-turtlebot3-fake-0.2.4-0_24
            // f048c7d7b410db2b7bd522f6dafcff59291badcb        refs/tags/rpm/ros-kinetic-turtlebot3-fake-1.0.0-0_23
            // f140c3f47e1295e0778febcd4d62cb8dbe01520f        refs/tags/rpm/ros-kinetic-turtlebot3-fake-1.0.0-0_24
            // b95f707233ce5aa66591457a7e509f36650e9cf5        refs/tags/rpm/ros-kinetic-turtlebot3-fake-1.0.0-1_23
            // 5ba095bf20834c188c8a75f9ee1edeb3f12c3469        refs/tags/rpm/ros-kinetic-turtlebot3-fake-1.0.0-1_24
            // 6d0d176e855538355108ff78a3f077260402f10c        refs/tags/rpm/ros-kinetic-turtlebot3-fake-1.0.0-2_23
            // 5145cfbf0231a50ba9d1b5c4ff50b3de860cd8b8        refs/tags/rpm/ros-kinetic-turtlebot3-fake-1.0.0-2_24
            // 7e1b6b91d0e2b92e0618383fc9ae881fc50f26cb        refs/tags/rpm/ros-kinetic-turtlebot3-fake-1.0.2-0_23
            // b3b0142b631f3915e4b93fb10d58a675f3f4aad2        refs/tags/rpm/ros-kinetic-turtlebot3-fake-1.0.2-0_24
            // f3d8851d1a37a7588c1f13bdef46c3d618eaacc6        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-0.1.4-0_23
            // d2c7bcbbfd7bb836ac6e8c4f8aca2e513923a850        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-0.1.4-0_24
            // 1dcdca6e9d692b0a80aa32c9855e7e05f073fa71        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-0.1.4-1_23
            // 8ff64986c35993a6b56400ad59f69d69583a9a9b        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-0.1.4-1_24
            // 0ec246c521ccee4bdcc23ad640203baa9bcb91a9        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-0.1.5-0_23
            // bed499dc961ab75d2b72847d978468b5f547f546        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-0.1.5-0_24
            // fab11f9e59f2319908a83ec8f24302d6c06ba94b        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-0.1.6-0_23
            // e7ddb49d81897f7d3ec074699aa224ff0787cbbf        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-0.1.6-0_24
            // 019d2be619e381a35bf8150c0a214f84215f6081        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-0.1.7-0_23
            // 50a0af841abf7361637edf7697732a24a285a917        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-0.1.7-0_24
            // 6d3dd5cbd0e59cff21cb189671fded1f25bf09a8        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-1.0.0-0_23
            // 3748ab70c92b19e403874e9d58d28b288a5096ed        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-1.0.0-0_24
            // 097cc46823a1204714fdf910d5a7ef9bffc61f49        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-1.0.0-1_23
            // a3f91b1001ce852c3a7198d5846b6d3dbbe1c0c8        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-1.0.0-1_24
            // b3da731cd3c2ea7b800edebb478f9e8fbb943027        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-1.0.0-2_23
            // 135f9dfbd4a96facf157002627f3e300fe10b042        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-1.0.0-2_24
            // 757e97f47c10179a56c467ceacd807f340de1790        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-1.0.2-0_23
            // 9c54e60dcafda61cf57b70c52e73527bc9ea4d78        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-1.0.2-0_24
            // ea13e90cdf89305a11e3bdf5072f5b86d548a216        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-plugin-0.2.0-0_23
            // b406960b73cd2f0d2c1dc163d3a1cbb777181bad        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-plugin-0.2.0-0_24
            // a226f46521eb6ec23d2affa553d2b9298b10d32d        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-ros-0.2.0-0_23
            // 5aee9ba39689e98e014f3c53c661b8a29a3b2ecc        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-ros-0.2.0-0_24
            // 846f7ec9a01c94ed2f3c8a64bbebd9310ba008a7        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-ros-0.2.4-0_23
            // 864158c9fce6c6e1e4d1eb6e1e87e50cee2fb58f        refs/tags/rpm/ros-kinetic-turtlebot3-gazebo-ros-0.2.4-0_24
            // 403c82d3bcb07b31348e877775da679d1b7634d6        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-0.1.4-0_23
            // 4016d8ef83f827be9913fa9271ead2e5bd7e33df        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-0.1.4-0_24
            // a6d5e64e9570e1dbf4f45e71f2b61e323e5210ee        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-0.1.4-1_23
            // 8d84bdd8fb93261a3c92af42e417c43f43a7b14c        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-0.1.4-1_24
            // 391e52d388a256a42831c1e0352295621eda5620        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-0.1.5-0_23
            // 58efddeb48377241037f8ced76ca9f687f504800        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-0.1.5-0_24
            // 6aae80a27460a99a4f89de556a6827096031cf79        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-0.1.6-0_23
            // f425b9858738d44ec797107376ea25c708115c44        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-0.1.6-0_24
            // f8cf813f7a3f4505f4a2437ab9a2f8d623900b24        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-0.1.7-0_23
            // 15b0c4f17a8a7fd0bbbbd3f1838c9fef00b3a063        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-0.1.7-0_24
            // 9a76f16860773f3c01f015c6df51ba2fc631ee0b        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-0.2.0-0_23
            // 9b445ea0d48a824cf2cda2c58250b490133e49ba        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-0.2.0-0_24
            // 8a87a60904d2017452fd5e92359cdbd4f5988eca        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-0.2.4-0_23
            // a22222b9a0f2d303134a21f6575e999b88f1aa99        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-0.2.4-0_24
            // f255348dbde3ba2785ba12151065065c3ad44bef        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-1.0.0-0_23
            // 359d75a942d60a2652fd7bcff286b55cbda80841        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-1.0.0-0_24
            // a5617f29760c1cebde1c7efef53853995e472d76        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-1.0.0-1_23
            // 81393a80e6e552d69b6371dbfa7bc8cde106aa6c        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-1.0.0-1_24
            // c5bc935dd665a59ccbecb86475d08f4457b6db89        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-1.0.0-2_23
            // d738d88db188f04b1a3a4c14accfba86fe6672dc        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-1.0.0-2_24
            // d4d52e374ce6b9757d76156e235ed28af5f4bd3b        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-1.0.2-0_23
            // e1e93f55c23c5393ba04c2b07c601cce14056655        refs/tags/rpm/ros-kinetic-turtlebot3-simulations-1.0.2-0_24
            // 1148df4efcff0e778f281c5edb2b5caa82766976        refs/tags/rpm/ros-melodic-turtlebot3-fake-1.1.0-0_28
            // 8369e021d0e510e3a538c9ef8e8c88f040b2d5cd        refs/tags/rpm/ros-melodic-turtlebot3-fake-1.2.0-0_28
            // 2506375ad6dca0b38461409ff6d1404babdcf331        refs/tags/rpm/ros-melodic-turtlebot3-gazebo-1.1.0-0_28
            // 0d9ae06f2d64b20a696ce7ce83e997e13c2b64d8        refs/tags/rpm/ros-melodic-turtlebot3-gazebo-1.2.0-0_28
            // c8be27b8d33d6e4eb2ee350a1011e2baa6990b47        refs/tags/rpm/ros-melodic-turtlebot3-simulations-1.1.0-0_28
            // db1fbaf00e2c27bd38f60cc8124abf1493ce5409        refs/tags/rpm/ros-melodic-turtlebot3-simulations-1.2.0-0_28
            // 495424eff3082624727904cd1de523947be6afd8        refs/tags/rpm/ros-noetic-turtlebot3-fake-1.3.1-1_32
            // fafc02395dbaf06184d0125519826a91f4b3dd25        refs/tags/rpm/ros-noetic-turtlebot3-fake-1.3.2-1_32
            // b655beaed83b37aa1e201d486df0b923e79a90fe        refs/tags/rpm/ros-noetic-turtlebot3-fake-1.3.2-2_32
            // 83f1df833745fd346c02e7d72aa2f20c6887d33f        refs/tags/rpm/ros-noetic-turtlebot3-gazebo-1.3.1-1_32
            // a292d16d4c0e3a5ef7382b0f6ffecd5bf0be8fe4        refs/tags/rpm/ros-noetic-turtlebot3-gazebo-1.3.2-1_32
            // 2b54167f5b40e362cd3b38478e96b4a5e7e400a3        refs/tags/rpm/ros-noetic-turtlebot3-gazebo-1.3.2-2_32
            // 277ee32ce39f36651f5e2dad6185fb56ccabe962        refs/tags/rpm/ros-noetic-turtlebot3-simulations-1.3.1-1_32
            // ee28847800f05565314d3214fbc9259e275ef0bb        refs/tags/rpm/ros-noetic-turtlebot3-simulations-1.3.2-1_32
            // 228049a5e3467982e803fe0372f601dba0a3609a        refs/tags/rpm/ros-noetic-turtlebot3-simulations-1.3.2-2_32
            // 2841caa51597f9a41fafb28849e6021b38bce795        refs/tags/upstream/0.1.4
            // 1445f5c9bfae740e258de90118ac95f61f5c74dc        refs/tags/upstream/0.1.5
            // 2d5e685e6ab55ea1ff553d2da08255ea162c8f9c        refs/tags/upstream/0.1.6
            // b3b40aafc64a8503dc2a6a9f07044adfded27008        refs/tags/upstream/0.1.7
            // 9ef6859850453e9b91bcd5ba44289fdba366073d        refs/tags/upstream/0.2.0
            // be15cb43a872e92d902f07f5647623d47c013f79        refs/tags/upstream/0.2.4
            // ff744f11e41802920c4afa02ac560d5e17e284f3        refs/tags/upstream/1.0.0
            // 1aefd70e585773b3af0262aad0ed19d17a6cef74        refs/tags/upstream/1.0.1
            // 58956c6fbe2f88adf82404385d7ffeb18712c62e        refs/tags/upstream/1.0.2
            // 5c63f230b22aa0c6289bf598c6e475ab6b272ff5        refs/tags/upstream/1.1.0
            // 3e92225f63dc2ccacd060898c80143ced0ebebee        refs/tags/upstream/1.2.0
            // 8ff1c415eaf0b330533e78649a393a0d36f023bd        refs/tags/upstream/1.3.1
            // 54881640297504b28a4e832d5ce55a53124d75c7        refs/tags/upstream/1.3.2
            const process = Deno.run({
                cmd: ["git", "ls-remote", githubUrl ], 
                stdout: "piped",
                stderr: "piped"
            })
            const tagInfoString = new TextDecoder().decode(await process.output())
            const afterFilter = tagInfoString.split(/\n/g).filter(
                each=>each.match(/.+refs\/tags\//)
            )
            const afterSplit = afterFilter.map(
                each=>each.split(/\trefs\/tags\//g).reverse() // reverse = make the tag the key instead of the value
            )
            const tagToCommitHash = Object.fromEntries(
                tagInfoString.split(/\n/g).filter(
                    each=>each.match(/.+refs\/tags\//)
                ).map(
                    each=>each.split(/\trefs\/tags\//g).reverse() // reverse = make the tag the key instead of the value
                )
            )
            
            commitHash = tagToCommitHash[tag]
            if (commitHash) {
                const pinnedUrl = `${githubUrl}/archive/${commitHash}.tar.gz`
                const sha256 = (await run`nix-prefetch fetchFromGitHub --repo ${repo} --owner ${owner} --rev ${commitHash} ${Stdout(returnAsString)}`).split("\n").filter(each=>each.trim())[0]
                replacements.push(
                    ` (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
${indent}repo = "${repo}";
${indent}rev = "${commitHash}";
${indent}owner = "${owner}";
${indent}sha256 = "${sha256}";`
                )
            } else {
                replacements.push(match[0])
            }
        } else {
            replacements.push(match[0])
        }
    }

    const replacementText = text.replace(pattern, (string)=>replacements.shift())
    
    if (replacementText != text) {
        await FileSystem.write({
            path: filePath,
            data: replacementText,
        })
    }
}

await Promise.all(
    filePaths.map(each=>pinDown(each).catch(error=>console.log(`error with: ${each}, ${error}`)))
)
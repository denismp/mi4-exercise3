pragma solidity ^0.5.1;

contract PublicArticle {
    string private articleName;
    string private articleText;

    uint public expires;
    address public owner = msg.sender;

    modifier onlyOwner() {
        require(msg.sender == owner,"you must be the owner");
        _;
    }

    modifier limitedTime() {
        require(now <= expires, "time has expired");
        _;
    }

    function setArticleName(string memory _articleName) public onlyOwner {
        articleName = _articleName;
    }

    function setArticleText(string memory _articleText) public onlyOwner {
        articleText = _articleText; 
    }

    function setDuration(uint _duration) public onlyOwner {
        expires = now + _duration; 
    }

    function getArticleName() view public returns (string memory) {
       return articleName; 
    }

    function getArticleText() view public limitedTime returns (string memory) {
        return articleText;
    }
}
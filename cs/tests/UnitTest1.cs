using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using src;

namespace tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            var player = new Player(1, DateTime.Now, PlayerStatus.NEWBIE);
            Assert.Fail("Do something here");
        }
    }
}

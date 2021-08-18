using Chat_application_server.Hubs;
using Chat_application_server.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using System;
using System.Threading.Tasks;

namespace Chat_application_server.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TestController : ControllerBase
    {
        private readonly IHubContext<ChatHub> _hub;
        public TestController(IHubContext<ChatHub> hub)
        {
            _hub = hub;
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> SendMessage(string MessageText, int UserId, string UserName)
        {
            MessageModel MessageModel = new MessageModel
            {
                CreateDate = DateTime.Now,
                MessageText = MessageText,
                UserId = UserId,
                UserName = UserName
            };

            await _hub.Clients.All.SendAsync("ReceiveMessage", MessageModel);
            return Ok();
        }
    }
}

using Microsoft.AspNetCore.SignalR;
using System;
using System.Threading.Tasks;
using Chat_application_server.Models;

namespace Chat_application_server.Hubs
{
    public class ChatHub : Hub
    {
        public async Task SendMessage(string UserName, int RandomUserId, string Message)
        {
            MessageModel MessageModel = new MessageModel
            {
                CreateDate = DateTime.Now,
                MessageText = Message,
                UserId = RandomUserId,
                UserName = UserName
            };
            await Clients.All.SendAsync("ReceiveMessage", MessageModel);
        }

        public async Task JoinUSer(string userName,int userId)
        {
            MessageModel MessageModel = new MessageModel
            {
                CreateDate = DateTime.Now,
                MessageText = userName + " joined chat",
                UserId = 0,
                UserName = "system"
            };
            await Clients.All.SendAsync("ReceiveMessage", MessageModel);
        }
    }
}

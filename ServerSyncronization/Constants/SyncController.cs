﻿using Dotmim.Sync;
using Dotmim.Sync.Web.Server;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text;

namespace ServerSyncronization.Constants
{
    [Route("api/[controller]")]
    [ApiController]
    public class SyncController : ControllerBase
    {
        private WebServerAgent webServerAgent;
        private readonly IWebHostEnvironment env;

        // Injected thanks to Dependency Injection
        public SyncController(WebServerAgent webServerAgent, IWebHostEnvironment env)
        
        {
            this.webServerAgent = webServerAgent;
            this.env = env;
        }

        /// <summary>
        /// This POST handler is mandatory to handle all the sync process
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task Post()
        {
            try
            {
                await webServerAgent.HandleRequestAsync(this.HttpContext).ConfigureAwait(true);
            }
            catch (Exception ex)
            {

            }

        }
        /// <summary>
        /// This GET handler is optional. It allows you to see the configuration hosted on the server
        /// </summary>
        [HttpGet]
        public async Task Get()
        {
            //if (env.IsDevelopment())
            {
                await this.HttpContext.WriteHelloAsync(webServerAgent);
            }
            //else
            //{
            //    var stringBuilder = new StringBuilder();

            //    stringBuilder.AppendLine("<!doctype html>");
            //    stringBuilder.AppendLine("<html>");
            //    stringBuilder.AppendLine("<title>Web Server properties</title>");
            //    stringBuilder.AppendLine("<body>");
            //    stringBuilder.AppendLine(" PRODUCTION MODE. HIDDEN INFO ");
            //    stringBuilder.AppendLine("</body>");
            //    await this.HttpContext.Response.WriteAsync(stringBuilder.ToString());
            //}
        }
    }
}

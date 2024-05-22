using Microsoft.AspNetCore.Mvc;

using pptx_api.Messages;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace pptx_api.Controllers;

[Route("api/[controller]")]
[ApiController]
public class PptxController : ControllerBase
{
    private readonly ILogger<PptxController> logger;

    public PptxController(ILogger<PptxController> logger)
    {
        this.logger = logger;
    }

    // POST api/<PptxController>
    [HttpPost]
    [Route("merge")]
    public IActionResult Post([FromBody] EchoRequestMessage message)
    {
        logger.LogInformation("Received {Message}; return Ok", message);

        return new OkObjectResult(new EchoRequestMessage
        {
            Content = new string('x', 1024 * 1024 * 12),
        });

        //return Ok(new EchoRequestMessage
        //{
        //    Content = new string('x', 1024 *  1024 * 12),
        //});
    }
}

using Microsoft.AspNetCore.Mvc;

namespace WareLogix.CommonWebApi.Controllers;

[Route("api/[controller]")]
[ApiController]
public class HealthController : ControllerBase
{
    // GET api/<HealthController>/5
    [HttpGet]
    [Route("health")]
    public IActionResult GetHealth()
    {
        return Ok();
    }

    // GET api/<HealthController>/5
    [HttpGet]
    [Route("live")]
    public IActionResult GetLiveliness()
    {
        return Ok();
    }

    [HttpGet]
    [Route("ready")]
    public IActionResult GetReadiness()
    {
        return Ok();
    }

}

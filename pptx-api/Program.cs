using Serilog.Events;
using Serilog;
using Serilog.Settings.Configuration;

Serilog.Debugging.SelfLog.WriteLine("APPLICATION STARTED {0}", DateTime.UtcNow);

Log.Logger = new LoggerConfiguration()
    .MinimumLevel.Override("Microsoft", LogEventLevel.Information)
    .Enrich.FromLogContext()
    .WriteTo.Console()
    .CreateBootstrapLogger();

var builder = WebApplication.CreateBuilder(args);

builder.WebHost.UseKestrel(option => option.AddServerHeader = false);

builder.Host.UseSerilog((context, serviceProvider) => serviceProvider
    .ReadFrom.Configuration(context.Configuration)
    //.ReadFrom.Configuration(context.Configuration, new ConfigurationReaderOptions { SectionName = "SerilogTraceLog" }), preserveStaticLogger: IsRunningInTestHostProcess()
    );

var applicationBaseUrl = "some tetst rul";

Log.Debug("applicationBaseUrl is {applicationBaseUrl}", applicationBaseUrl);

Log.Information("applicationBaseUrl is {applicationBaseUrl}", applicationBaseUrl);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

//TODO: Add feature flag
//app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();

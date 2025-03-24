using Newtonsoft.Json;
using Quiz.Entity.Database;
using Quiz.WebApi.Extensions;

var builder = WebApplication.CreateBuilder(args);
var service = builder.Services;

service.AddHttpContextAccessor();
service.AddControllers();
service.GetExtensions(builder.Configuration);
service.GetServices();

service.AddCors(options =>
{
    options.AddPolicy("CorsPolicy", builder =>
    {
        builder.AllowAnyHeader()
               .AllowAnyMethod()
               .SetIsOriginAllowed(host => true)
               .AllowCredentials();
    });
});

service.AddControllers().AddNewtonsoftJson(options =>
{
    options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
});


builder.Services.AddDbContext<DbEntities>();

var app = builder.Build();

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseCors("CorsPolicy");
app.UseHttpsRedirection();
app.UseStaticFiles();
app.MapControllers();
app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();
app.Run();
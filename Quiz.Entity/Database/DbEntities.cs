using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Quiz.Entity.Models;

namespace Quiz.Entity.Database
{
    public class DbEntities : DbContext
    {
        private readonly IConfiguration _configuration;
        private readonly IHttpContextAccessor _context;


        public DbEntities(IConfiguration configuration, IHttpContextAccessor context)
        {
            _configuration = configuration;
            _context = context;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(_configuration.GetConnectionString("TakaKhela"));
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
        }

        public override Task<int> SaveChangesAsync(bool acceptAllChangesOnSuccess, CancellationToken cancellationToken = new())
        {
            var userId = 0;
            var sid = _context.HttpContext?.User?.FindFirst(System.Security.Claims.ClaimTypes.Sid);
            if (sid != null)
            {
                userId = int.Parse(sid.Value);
            }

            foreach (var entry in ChangeTracker.Entries())
                switch (entry.State)
                {
                    case EntityState.Added when entry.Entity is BaseModel:
                        entry.Property(nameof(BaseModel.UpdatedBy)).IsModified = false;
                        entry.Property(nameof(BaseModel.UpdatedDate)).IsModified = false;
                        entry.Property(nameof(BaseModel.CreatedBy)).CurrentValue = userId;
                        entry.Property(nameof(BaseModel.CreatedDate)).CurrentValue = DateTime.Now;
                        break;

                    case EntityState.Modified when entry.Entity is BaseModel:
                        entry.Property(nameof(BaseModel.CreatedBy)).IsModified = false;
                        entry.Property(nameof(BaseModel.CreatedDate)).IsModified = false;
                        entry.Property(nameof(BaseModel.UpdatedBy)).CurrentValue = userId;
                        entry.Property(nameof(BaseModel.UpdatedDate)).CurrentValue = DateTime.Now;
                        break;

                }
            return base.SaveChangesAsync(acceptAllChangesOnSuccess, cancellationToken);
        }

        //App
        public DbSet<ApiLog> ApiLogs { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Menu> Menus { get; set; }
        public DbSet<Login> Logins { get; set; }
        public DbSet<Carousel> Carousels => Set<Carousel>();
        public DbSet<Question> Questions { get; set; }
        public DbSet<Option> Options { get; set; }
        public DbSet<Transaction> Transactions { get; set; }
        public DbSet<AppConfig> AppConfigs { get; set; }
        public DbSet<Program> Programs { get; set; }
        public DbSet<Subject> Subjects { get; set; }
        public DbSet<Chapter> Chapters { get; set; }
        public DbSet<Course> Courses { get; set; }
        public DbSet<Exam> Exams { get; set; }

        //Lottery
        public DbSet<Prize> Prizes { get; set; }
        public DbSet<UserPrize> UserPrizes { get; set; }

    }
}
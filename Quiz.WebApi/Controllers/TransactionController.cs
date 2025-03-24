using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Quiz.Entity.Database;
using Quiz.Helper.VModels;
using Quiz.WebApi.Extensions;
using System.Transactions;

namespace Quiz.WebApi.Controllers
{
    [ApiController]
    [Route("api/transaction")]
    public class TransactionController : MyController
    {
        private readonly DbEntities _entities;

        public TransactionController(DbEntities entities,
            IAggregateService aggregate) : base(aggregate)
        {
            _entities = entities;
        }

        [HttpPost]
        [Route("save-transaction")]
        public async Task<IActionResult> SaveTransaction([FromBody] Transaction transaction)
        {
            await _entities.AddAsync(transaction);
            var status = await _entities.SaveChangesAsync();

            if (status <= 0)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "Transaction failed"
                });
            }

            return Ok(new
            {
                Success = true,
                Message = "Transaction successfully."
            });
        }

        [HttpPost]
        [Route("transaction-list")]
        public async Task<IActionResult> TransactionList([FromBody] AppParam param)
        {
            var transactions = await _entities.Transactions
               .Where(x => x.UserId == param.UserId)
               .AsNoTracking()
               .ToListAsync();

            if (!transactions.Any())
            {
                return Ok(new
                {
                    Success = false,
                    Message = "There are no data found"
                });
            }

            return Ok(new
            {
                Success = true,
                Transactions = transactions
            });
        }
    }
}

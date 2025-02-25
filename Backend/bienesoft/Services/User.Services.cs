﻿// using bienesoft.models;
// using bienesoft.Models;
// using Microsoft.EntityFrameworkCore;
// using System.Collections.Generic;
// using System.Threading.Tasks;

// namespace bienesoft.Services
// {
//     public class UserServices
//     {
//         private readonly AppDbContext _context;

//         public UserServices(AppDbContext context)
//         {
//             _context = context;
//         }



//         public async Task<IEnumerable<User>> AllUsersAsync()
//         {
//             return await _context.user.ToListAsync();
//         }

//         public async Task AddUserAsync(User user)
//         {
//             await _context.user.AddAsync(user);
//             await _context.SaveChangesAsync();
//         }

//         public async Task<User> GetByIdAsync(int id)
//         {
//             return await _context.user.FirstOrDefaultAsync(p => p.User_Id == id);
//         }

//         public async Task DeleteAsync(int id)
//         {
//             var user = await GetByIdAsync(id);
//             if (user != null)
//             {
//                 try
//                 {
//                     _context.user.Remove(user);
//                     await _context.SaveChangesAsync();
//                 }
//                 catch (Exception ex)
//                 {
//                     throw new Exception("No se pudo eliminar el usuario: " + ex.Message);
//                 }
//             }
//             else
//             {
//                 throw new KeyNotFoundException("El usuario con el ID " + id + " no se pudo encontrar.");
//             }
//         }

//         public async Task UpdateUserAsync(User user)
//         {
//             if (user == null)
//             {
//                 throw new ArgumentNullException(nameof(user), "El modelo de usuario es nulo");
//             }

//             // Busca el usuario existente usando Where
//             var existingUser = await _context.user
//                 .Where(u => u.User_Id == user.User_Id)
//                 .FirstOrDefaultAsync();

//             if (existingUser == null)
//             {
//                 throw new ArgumentException("Usuario no encontrado");
//             }

//             // Asignar todas las propiedades del objeto user al objeto existingUser
//             // Puedes usar AutoMapper o simplemente asignar manualmente
//             existingUser.Email = user.Email;
//             existingUser.HashedPassword = user.HashedPassword;
//             existingUser.Salt = user.Salt;
//             existingUser.SessionCount = user.SessionCount;
//             existingUser.TokJwt = user.TokJwt;
//             existingUser.Blockade = user.Blockade;
//             existingUser.UserType = user.UserType;
//             existingUser.Asset = user.Asset;

//             // Guarda los cambios en el contexto
//             await _context.SaveChangesAsync();
//         }

//         // Nuevo método para obtener un usuario por correo electrónico
//         public async Task<User> GetByEmailAsync(string email)
//         {
//             return await _context.user.FirstOrDefaultAsync(u => u.Email == email);
//         }
//         public async Task<bool> UserByEmail(string email)
//         {
//             return await _context.user.AnyAsync(u => u.Email == email);
//         } 
//     }
// }
using bienesoft.models;
using bienesoft.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace bienesoft.Services
{
    public class UserServices
    {
        private readonly AppDbContext _context;

        public UserServices(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<User>> AllUsersAsync()
        {
            return await _context.user.ToListAsync();
        }

        public async Task AddUserAsync(User user)
        {
            await _context.user.AddAsync(user);
            await _context.SaveChangesAsync();
        }

        public async Task<User> GetByIdAsync(int id)
        {
            return await _context.user.FirstOrDefaultAsync(p => p.User_Id == id);
        }

        public async Task DeleteAsync(int id)
        {
            var user = await GetByIdAsync(id);
            if (user != null)
            {
                try
                {
                    _context.user.Remove(user);
                    await _context.SaveChangesAsync();
                }
                catch (Exception ex)
                {
                    throw new Exception("No se pudo eliminar el usuario: " + ex.Message);
                }
            }
            else
            {
                throw new KeyNotFoundException("El usuario con el ID " + id + " no se pudo encontrar.");
            }
        }

        public async Task UpdateUserAsync(User user)
        {
            if (user == null)
            {
                throw new ArgumentNullException(nameof(user), "El modelo de usuario es nulo");
            }

            var existingUser = await _context.user
                .Where(u => u.User_Id == user.User_Id)
                .FirstOrDefaultAsync();

            if (existingUser == null)
            {
                throw new ArgumentException("Usuario no encontrado");
            }

            existingUser.Email = user.Email;
            existingUser.HashedPassword = user.HashedPassword;
            existingUser.Salt = user.Salt;
            existingUser.SessionCount = user.SessionCount;
            existingUser.TokJwt = user.TokJwt;
            existingUser.Blockade = user.Blockade;
            existingUser.UserType = user.UserType;
            existingUser.Asset = user.Asset;
            existingUser.ResetToken = user.ResetToken;
            existingUser.ResetTokenExpiration = user.ResetTokenExpiration;

            await _context.SaveChangesAsync();
        }

        public async Task<User> GetByEmailAsync(string email)
        {
            return await _context.user
                .Where(u => u.Email == email)
                .Select(u => new User
                {
                    User_Id = u.User_Id,
                    Email = u.Email,
                    HashedPassword = u.HashedPassword ?? string.Empty, // Asegurarse de que no sea NULL
                    Salt = u.Salt ?? string.Empty, // Asegurarse de que no sea NULL
                    SessionCount = u.SessionCount,
                    TokJwt = u.TokJwt ?? string.Empty, // Asegurarse de que no sea NULL
                    Blockade = u.Blockade,
                    UserType = u.UserType,
                    Asset = u.Asset, // Asegurarse de que no sea NULL
                    ResetToken = u.ResetToken ?? string.Empty, // Asegurarse de que no sea NULL
                    ResetTokenExpiration = u.ResetTokenExpiration ?? DateTime.UtcNow // Si es NULL, asigna la fecha actual
                })
                .FirstOrDefaultAsync();
        }


        public async Task<bool> UserByEmail(string email)
        {
            return await _context.user.AnyAsync(u => u.Email == email);
        }

        // 🔹 Genera un token de restablecimiento y lo guarda en el usuario
        public async Task<string> GeneratePasswordResetToken(string email)
        {
            var user = await GetByEmailAsync(email);
            if (user == null)
            {
                throw new ArgumentException("El correo electrónico no está registrado.");
            }

            // Generar un token aleatorio
            string resetToken = Guid.NewGuid().ToString();
            user.ResetToken = resetToken;
            user.ResetTokenExpiration = DateTime.UtcNow.AddHours(1); // Expira en 1 hora

            await _context.SaveChangesAsync();
            return resetToken;
        }

        // 🔹 Obtiene un usuario por el token de restablecimiento
        public async Task<User> GetUserByResetToken(string token)
        {
            return await _context.user.FirstOrDefaultAsync(u => u.ResetToken == token && u.ResetTokenExpiration > DateTime.UtcNow);
        }

        // 🔹 Limpia el token después de restablecer la contraseña
        public async Task ClearResetToken(User user)
        {
            user.ResetToken = null;
            user.ResetTokenExpiration = null;
            await _context.SaveChangesAsync();
        }
        public async Task<User> GetByTokenAsync(string token)
        {
            return await _context.user.FirstOrDefaultAsync(u => u.ResetToken == token);
        }

    }
}


using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP7_QQSM.Models;
using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Http;

namespace TP7_QQSM.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;


    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Player()
    {
        return View();
    }
    public IActionResult Pregunta(){
        return View();
    }
  
  /*
    [HttpGet]
    IActionResult Jugar(string nombre)
    {
    }

    
    IActionResult PreguntaRespondida(char Opcion1, char Opcion2){

    }

    IActionResult FinDelJuego(){
        
    }
    */

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}

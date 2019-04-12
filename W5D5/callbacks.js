window.setTimeout(function(){alert('HAMMER TIME!');},5000);

function hammerTime(time)
{
    window.setTimeout(function()
    {
        alert(`${time} is HAMMER TIME!`);
    })
;}
const readline = require('readline');

const reader = readline.createInterface(
{
    input:process.stdin,output:process.stdout
});

function teaAndBiscuits()
{
    reader.question('Would you like tea?',
    function(res)
    {
        console.log(`You said ${res}.`);
        reader.question('Would you like biscuits?',
        function(res2)
        {
            console.log(`You said ${res2}.`);
            const first=(res ==='yes') ? 'do' : 'don\'t';
            const second=(res2 ==='yes') ? 'do' : 'don\'t';
            console.log(`So you ${first} want tea and you ${second} want biscuits.`);
            reader.close();
        });
    });
}
function fn(ticketData) {
    result = [];

    data = {
        "ticketId": ticketData.ticketTypeDisplays[0].experienceTicketId,
        "ticketTitle": ticketData.ticketTypeDisplays[0].title,
        "ticketPrice": ticketData.ticketTypeDisplays[0].ticketPrice.discountedPrice.currencyValue.amount
     };

    result.push(data);

  return result;
}